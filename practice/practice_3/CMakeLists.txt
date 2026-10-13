cmake_minimum_required(VERSION 3.16)
project(PlutoSDR C)

set(CMAKE_BUILD_TYPE Debug)

set(LIB_ROOT        ${CMAKE_SOURCE_DIR}/lib)
set(SOAPY_SDR_ROOT  ${LIB_ROOT}/SoapySDR/install)
set(LIBIIO_ROOT     ${LIB_ROOT}/libiio/install)
set(LIBAD9361_ROOT  ${LIB_ROOT}/libad9361-iio/install)

list(APPEND CMAKE_PREFIX_PATH ${SOAPY_SDR_ROOT})
list(APPEND CMAKE_PREFIX_PATH ${LIBIIO_ROOT})
list(APPEND CMAKE_PREFIX_PATH ${LIBAD9361_ROOT})

find_package(SoapySDR REQUIRED)

set(MAIN_SOURCE_FILES src/main.c)
add_executable(main ${MAIN_SOURCE_FILES})

target_include_directories(main PRIVATE
    ${SOAPY_SDR_ROOT}/include
)

target_link_directories(main PRIVATE
    ${SOAPY_SDR_ROOT}/lib
    ${LIBIIO_ROOT}/lib
    ${LIBAD9361_ROOT}/lib
)

target_link_libraries(main PRIVATE ${SoapySDR_LIBRARIES})