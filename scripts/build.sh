#!/bin/bash

# Exit on error
set -e  

# Define color codes
RED='\033[0;31m'      # Red for errors
GREEN='\033[0;32m'    # Green for success messages
YELLOW='\033[0;33m'   # Yellow for prompts
BLUE='\033[0;34m'     # Blue for info
NC='\033[0m'          # No Color (reset)

# Prompt user to choose the build type

echo ""
echo -e "${YELLOW}Choose build type:${NC}"
echo -e "1) ${BLUE}Release${NC}"
echo -e "2) ${BLUE}Debug${NC}"
echo -e "3) ${BLUE}Test${NC}"
echo ""
read -p "Enter your choice (1-3): " choice
echo ""

# Set the build type based on user input

if [[ "$choice" == "1" ]]; then
    echo -e "${BLUE}Building Release version...${NC}"
    echo ""
    conan create . --build=missing -s build_type=Release
    echo ""
    echo -e "${GREEN}Release build completed successfully!${NC}"

elif [[ "$choice" == "2" ]]; then
    echo -e "${BLUE}Building Debug version...${NC}"
    echo ""
    conan create . --build=missing -s build_type=Debug
    echo ""
    echo -e "${GREEN}Debug build completed successfully!${NC}"

elif [[ "$choice" == "3" ]]; then
    echo -e "${BLUE}Building Test version...${NC}"
    echo ""
    mkdir -p build && cd build
    rm -rf *
    cmake .. -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug
    cmake --build .
    ctest --output-on-failure
    echo ""
    echo -e "${GREEN}Test build completed successfully!${NC}"

else
    echo -e "${RED}ERROR: Invalid choice!${NC}"
    exit 1

fi
