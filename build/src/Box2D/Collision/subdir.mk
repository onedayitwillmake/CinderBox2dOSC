################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Collision/b2BroadPhase.cpp \
../src/Box2D/Collision/b2CollideCircle.cpp \
../src/Box2D/Collision/b2CollidePolygon.cpp \
../src/Box2D/Collision/b2Collision.cpp \
../src/Box2D/Collision/b2Distance.cpp \
../src/Box2D/Collision/b2DynamicTree.cpp \
../src/Box2D/Collision/b2TimeOfImpact.cpp 

OBJS += \
./src/Box2D/Collision/b2BroadPhase.o \
./src/Box2D/Collision/b2CollideCircle.o \
./src/Box2D/Collision/b2CollidePolygon.o \
./src/Box2D/Collision/b2Collision.o \
./src/Box2D/Collision/b2Distance.o \
./src/Box2D/Collision/b2DynamicTree.o \
./src/Box2D/Collision/b2TimeOfImpact.o 

CPP_DEPS += \
./src/Box2D/Collision/b2BroadPhase.d \
./src/Box2D/Collision/b2CollideCircle.d \
./src/Box2D/Collision/b2CollidePolygon.d \
./src/Box2D/Collision/b2Collision.d \
./src/Box2D/Collision/b2Distance.d \
./src/Box2D/Collision/b2DynamicTree.d \
./src/Box2D/Collision/b2TimeOfImpact.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Collision/%.o: ../src/Box2D/Collision/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


