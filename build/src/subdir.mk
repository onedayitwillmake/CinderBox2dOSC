################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/BasicBox2DApp.cpp \
../src/Client.cpp 

OBJS += \
./src/BasicBox2DApp.o \
./src/Client.o 

CPP_DEPS += \
./src/BasicBox2DApp.d \
./src/Client.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/Users/onedayitwillmake/GIT/LIBRARY/Cinder/boost -I/Users/onedayitwillmake/GIT/LIBRARY/Cinder/include -I"/Users/onedayitwillmake/GIT/CinderBox2dOSC/src" -I"/Users/onedayitwillmake/GIT/CinderBox2dOSC/include" -I"/Users/onedayitwillmake/GIT/CinderBox2dOSC/include/ip" -I"/Users/onedayitwillmake/GIT/CinderBox2dOSC/include/osc" -O0 -g -Wall -c -fmessage-length=0 -arch i386 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


