# Description: Makefile for flutter project
# Add all the commands you want to run in the project here

buildRunner:
	@echo "Running build_runner..."
	@@dart run build_runner build --delete-conflicting-outputs

buildApk:
	@echo "Building apk..."
	@flutter build apk --no-tree-shake-icons

watchRunner:
	@echo "Running build_runner watch..."
	@dart run build_runner watch --delete-conflicting-outputs