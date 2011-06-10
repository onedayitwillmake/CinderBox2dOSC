################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Dynamics/b2Body.cpp \
../src/Box2D/Dynamics/b2ContactManager.cpp \
../src/Box2D/Dynamics/b2Fixture.cpp \
../src/Box2D/Dynamics/b2Island.cpp \
../src/Box2D/Dynamics/b2World.cpp \
../src/Box2D/Dynamics/b2WorldCallbacks.cpp 

OBJS += \
./src/Box2D/Dynamics/b2Body.o \
./src/Box2D/Dynamics/b2ContactManager.o \
./src/Box2D/Dynamics/b2Fixture.o \
./src/Box2D/Dynamics/b2Island.o \
./src/Box2D/Dynamics/b2World.o \
./src/Box2D/Dynamics/b2WorldCallbacks.o 

CPP_DEPS += \
./src/Box2D/Dynamics/b2Body.d \
./src/Box2D/Dynamics/b2ContactManager.d \
./src/Box2D/Dynamics/b2Fixture.d \
./src/Box2D/Dynamics/b2Island.d \
./src/Box2D/Dynamics/b2World.d \
./src/Box2D/Dynamics/b2WorldCallbacks.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Dynamics/%.o: ../src/Box2D/Dynamics/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


