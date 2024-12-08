# Define variables
SHELL_SCRIPT = solution.sh
INPUT_FILE = input.txt
README_FILE = README.md
ZIP_FILE = solution_package.zip
GIT_REPO = https://github.com/yourusername/yourrepo.git

# Default target: help
help:
	@echo "Full Name: Shawn Saetern"
	@echo "1. To build the deployment package, run: make build"
	@echo "2. To deploy the package, run: make deploy"

# Build target: package the solution assets into a ZIP file
build: $(SHELL_SCRIPT) $(INPUT_FILE) $(README_FILE)
	@echo "Building deployment package..."
	zip $(ZIP_FILE) $(SHELL_SCRIPT) $(INPUT_FILE) $(README_FILE)
	@echo "Deployment package $(ZIP_FILE) created."

# Deploy target: commit the ZIP file to the git repository
deploy: build
	@echo "Deploying the solution..."
	git add $(ZIP_FILE)
	git commit -m "Deploying solution package $(ZIP_FILE)"
	git push $(GIT_REPO)
	@echo "Solution deployed successfully."

# Clean target (optional but useful for cleaning up files)
clean:
	rm -f $(ZIP_FILE)
	@echo "Cleaned up deployment package."

