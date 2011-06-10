################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Common/b2BlockAllocator.cpp \
../src/Box2D/Common/b2Math.cpp \
../src/Box2D/Common/b2Settings.cpp \
../src/Box2D/Common/b2StackAllocator.cpp 

OBJS += \
./src/Box2D/Common/b2BlockAllocator.o \
./src/Box2D/Common/b2Math.o \
./src/Box2D/Common/b2Settings.o \
./src/Box2D/Common/b2StackAllocator.o 

CPP_DEPS += \
./src/Box2D/Common/b2BlockAllocator.d \
./src/Box2D/Common/b2Math.d \
./src/Box2D/Common/b2Settings.d \
./src/Box2D/Common/b2StackAllocator.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Common/%.o: ../src/Box2D/Common/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


