################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Collision/Shapes/b2CircleShape.cpp \
../src/Box2D/Collision/Shapes/b2PolygonShape.cpp 

OBJS += \
./src/Box2D/Collision/Shapes/b2CircleShape.o \
./src/Box2D/Collision/Shapes/b2PolygonShape.o 

CPP_DEPS += \
./src/Box2D/Collision/Shapes/b2CircleShape.d \
./src/Box2D/Collision/Shapes/b2PolygonShape.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Collision/Shapes/%.o: ../src/Box2D/Collision/Shapes/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


