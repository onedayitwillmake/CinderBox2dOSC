################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/b2cinder/BoundaryElement.cpp \
../src/b2cinder/BoxElement.cpp \
../src/b2cinder/Conversions.cpp \
../src/b2cinder/PhysicsElement.cpp \
../src/b2cinder/Sandbox.cpp 

OBJS += \
./src/b2cinder/BoundaryElement.o \
./src/b2cinder/BoxElement.o \
./src/b2cinder/Conversions.o \
./src/b2cinder/PhysicsElement.o \
./src/b2cinder/Sandbox.o 

CPP_DEPS += \
./src/b2cinder/BoundaryElement.d \
./src/b2cinder/BoxElement.d \
./src/b2cinder/Conversions.d \
./src/b2cinder/PhysicsElement.d \
./src/b2cinder/Sandbox.d 


# Each subdirectory must supply rules for building sources it contributes
src/b2cinder/%.o: ../src/b2cinder/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


