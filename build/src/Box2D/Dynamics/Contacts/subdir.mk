################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Box2D/Dynamics/Contacts/b2CircleContact.cpp \
../src/Box2D/Dynamics/Contacts/b2Contact.cpp \
../src/Box2D/Dynamics/Contacts/b2ContactSolver.cpp \
../src/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.cpp \
../src/Box2D/Dynamics/Contacts/b2PolygonContact.cpp \
../src/Box2D/Dynamics/Contacts/b2TOISolver.cpp 

OBJS += \
./src/Box2D/Dynamics/Contacts/b2CircleContact.o \
./src/Box2D/Dynamics/Contacts/b2Contact.o \
./src/Box2D/Dynamics/Contacts/b2ContactSolver.o \
./src/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.o \
./src/Box2D/Dynamics/Contacts/b2PolygonContact.o \
./src/Box2D/Dynamics/Contacts/b2TOISolver.o 

CPP_DEPS += \
./src/Box2D/Dynamics/Contacts/b2CircleContact.d \
./src/Box2D/Dynamics/Contacts/b2Contact.d \
./src/Box2D/Dynamics/Contacts/b2ContactSolver.d \
./src/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.d \
./src/Box2D/Dynamics/Contacts/b2PolygonContact.d \
./src/Box2D/Dynamics/Contacts/b2TOISolver.d 


# Each subdirectory must supply rules for building sources it contributes
src/Box2D/Dynamics/Contacts/%.o: ../src/Box2D/Dynamics/Contacts/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/boost -I/Users/mariogonzalez/GIT/LIBRARY/Cinder/include -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/src" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/ip" -I"/Users/mariogonzalez/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


