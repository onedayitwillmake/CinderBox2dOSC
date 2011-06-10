################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Dynamics/Joints/b2DistanceJoint.cpp \
../src/Box2D/Dynamics/Joints/b2FrictionJoint.cpp \
../src/Box2D/Dynamics/Joints/b2GearJoint.cpp \
../src/Box2D/Dynamics/Joints/b2Joint.cpp \
../src/Box2D/Dynamics/Joints/b2LineJoint.cpp \
../src/Box2D/Dynamics/Joints/b2MouseJoint.cpp \
../src/Box2D/Dynamics/Joints/b2PrismaticJoint.cpp \
../src/Box2D/Dynamics/Joints/b2PulleyJoint.cpp \
../src/Box2D/Dynamics/Joints/b2RevoluteJoint.cpp \
../src/Box2D/Dynamics/Joints/b2WeldJoint.cpp 

OBJS += \
./src/Box2D/Dynamics/Joints/b2DistanceJoint.o \
./src/Box2D/Dynamics/Joints/b2FrictionJoint.o \
./src/Box2D/Dynamics/Joints/b2GearJoint.o \
./src/Box2D/Dynamics/Joints/b2Joint.o \
./src/Box2D/Dynamics/Joints/b2LineJoint.o \
./src/Box2D/Dynamics/Joints/b2MouseJoint.o \
./src/Box2D/Dynamics/Joints/b2PrismaticJoint.o \
./src/Box2D/Dynamics/Joints/b2PulleyJoint.o \
./src/Box2D/Dynamics/Joints/b2RevoluteJoint.o \
./src/Box2D/Dynamics/Joints/b2WeldJoint.o 

CPP_DEPS += \
./src/Box2D/Dynamics/Joints/b2DistanceJoint.d \
./src/Box2D/Dynamics/Joints/b2FrictionJoint.d \
./src/Box2D/Dynamics/Joints/b2GearJoint.d \
./src/Box2D/Dynamics/Joints/b2Joint.d \
./src/Box2D/Dynamics/Joints/b2LineJoint.d \
./src/Box2D/Dynamics/Joints/b2MouseJoint.d \
./src/Box2D/Dynamics/Joints/b2PrismaticJoint.d \
./src/Box2D/Dynamics/Joints/b2PulleyJoint.d \
./src/Box2D/Dynamics/Joints/b2RevoluteJoint.d \
./src/Box2D/Dynamics/Joints/b2WeldJoint.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Dynamics/Joints/%.o: ../src/Box2D/Dynamics/Joints/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


