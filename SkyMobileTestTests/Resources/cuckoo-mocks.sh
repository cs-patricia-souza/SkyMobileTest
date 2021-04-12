
# Define output file. Change "$PROJECT_DIR/${PROJECT_NAME}Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="$PROJECT_DIR/${PROJECT_NAME}Tests/Mocks/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "${PROJECT_DIR}/${PROJECT_NAME}" to your project's root source folder, if it's not the default name.
INPUT_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
"${PODS_ROOT}/Cuckoo/run" generate --testable "$PROJECT_NAME" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/Modules/Home/Model/Movie.swift" \
"$INPUT_DIR/Modules/Home/HomeCoordinator.swift" \
"$INPUT_DIR/Modules/Home/HomeProtocols.swift" \
"$INPUT_DIR/Modules/Home/HomeRepository.swift" \
"$INPUT_DIR/Modules/Home/HomeView.swift" \
"$INPUT_DIR/Modules/Home/HomeViewModel.swift" \

# Remove timestamps from OUTPUT_FILE
sed -i '' -e 's/.swift at .*$/.swift/' ${OUTPUT_FILE}
