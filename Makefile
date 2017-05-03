PACKAGE_NAME=archeopteryx

# Directory where build package should be placed.
BUILD_TARGET=target

all: build

build: $(BUILD_TARGET) tests docs

# Create portable bundle package ready to be installed.
$(BUILD_TARGET):
	mkdir -p $(BUILD_TARGET)
	Rscript -e "devtools::build(path = \"$(BUILD_TARGET)\")"

# Run all tests. Tests in subprojects are not run explicitly because we assume
# that building them requires them to pass tests anyway.
test: $(BUILD_TARGET)
	Rscript run_all_tests.R

# Generate documentation.
docs:
  Rscript -e "devtools::document()"

# Check the code and package structure for common problems; run tests.
# The number of ERRORs and WARNINGs should be zero. Ideally, the number of
# NOTE's also should be zero. Currently there's one NOTE that says that the
# paths to some of the files are too long (see README).
check: build
	Rscript -e "devtools::check()"

# Install the package in the system.
install: test docs
	R CMD INSTALL .

# Uninstall the package.
uninstall:
	R CMD REMOVE $(PACKAGE_NAME)

clean: clean-subprojects
	rm -rf man NAMESPACE *.tar.gz
	rm -rf $(BUILD_TARGET)

