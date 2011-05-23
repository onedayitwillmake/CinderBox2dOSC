#include "cinder/app/AppBasic.h"
#include <list>
#include <vector>
#include "cinder/params/Params.h"
#include "cinder/Font.h"
#include "cinder/Utilities.h"
#include "cinder/Rand.h"

#include <b2cinder/b2cinder.h>

#include "cinder/Rand.h"
#include <cstdlib>
#include "Box2D/Common/b2Math.h"

#include "OscListener.h"
#include "Client.h"

#define LOCAL_CLIENT "-1"
using namespace ci;
using namespace ci::app;
using namespace ci::box2d;
using namespace std;


class BasicBox2DApp : public AppBasic {
 public:
	void mouseDrag( MouseEvent event );
	void mouseDown( MouseEvent event );
	void mouseUp( MouseEvent event );
	void	keyDown( KeyEvent event );
	void	keyUp( KeyEvent event );

	void update();
	void updateClients();
	void prepareSettings(Settings* settings);
	void setup();
	void draw();

	// OSC
	void	debugOutputAllOSC();
	void	debugOutputSingleOSCMessage( osc::Message message );
	std::string getClientIdFromMessage( std::string message );

	// Client controller
	Client*	getClientWithId( std::string clientid );
	Client*	addClientWithId( std::string clientid );
	Client*	removeClientWithId( std::string clientid );

private:
	void addBox( ci::Vec2f position );

	osc::Listener			listener;	// OSCListener
	Client*					_localClient;	// Client that represents us
	std::vector<Client*>	_allClients;	// All Clients connected

    list<Vec2f>		mPoints;
	Sandbox mSandbox;
	Font mFont;
};

void BasicBox2DApp::prepareSettings(Settings* settings)
{
	settings->setWindowSize(1024, 768);
	settings->setFrameRate(60.0f);
}


/*
 * b2InvSqrt(float32 x)
{
	union
	{
		float32 x;
		int32 i;
	} convert;

	convert.x = x;
	float32 xhalf = 0.5f * x;
	convert.i = 0x5f3759df - (convert.i >> 1);
	x = convert.x;
	x = x * (1.5f - xhalf * x * x);
	return x;
}
 */
void BasicBox2DApp::setup()
{
	for (int var = 1; var < 100; ++var) {
		float regular = 1.0 / ci::math<float>::sqrt(var);
		float fast = b2InvSqrt(var);

		std::cout << regular << ":" << fast << std::endl;
	}
	mSandbox.init();
	_localClient = addClientWithId( LOCAL_CLIENT );

	mFont = ci::Font( "Arial", 12.0f );
	listener.setup(8899);
}

void BasicBox2DApp::mouseDrag( MouseEvent event )
{
	_localClient->setPosition( getMousePos() );
}

void BasicBox2DApp::mouseDown( MouseEvent event )
{
	_localClient->setPosition( getMousePos() );
	_localClient->setMouseIsDown( true );
}

void BasicBox2DApp::mouseUp( MouseEvent event )
{
	_localClient->setPosition( getMousePos() );
	_localClient->setMouseIsDown( false );
}

void BasicBox2DApp::keyDown( KeyEvent event )
{
	if(event.getCode() == KeyEvent::KEY_z) {
		_localClient->setAltIsDown( true );
	}
}

void BasicBox2DApp::keyUp( KeyEvent event )
{
	if(event.getCode() == KeyEvent::KEY_z) {
		_localClient->setAltIsDown( false );
	}
}

void BasicBox2DApp::update()
{
	mSandbox.update();
//	debugOutputAllOSC();
//	return;
	while (listener.hasWaitingMessages()) {
			osc::Message message;
			listener.getNextMessage(&message);

			if(message.getArgType(0) != osc::TYPE_STRING) {
				continue;
			};

			std::string command = message.getArgAsString( 0 );

			if( command == "add" ) {
				addClientWithId( message.getArgAsString(1) );
			}
			else if ( command == "mov" ) {
				/*
					New message received
					Address: /nodejs/1
					Num Arg: 5
					-- Argument 0
					---- type: string
					------ value: mov
					-- Argument 1
					---- type: int32
					------ value: 0
					-- Argument 2
					---- type: int32
					------ value: 0
					-- Argument 3
					---- type: int32
					------ value: 5
					-- Argument 4
					---- type: int32
					------ value: 65
				 */


				std::string clientid = getClientIdFromMessage( message.getAddress() );
				int			altIsDown = message.getArgAsInt32(1);
				int			mouseIsDown = message.getArgAsInt32(2);
				float		mouseX = ((float) message.getArgAsInt32(3)) / 100.0f;
				float		mouseY = ((float) message.getArgAsInt32(4)) / 100.0f;
	            ci::Vec2f mousePosition = ci::Vec2f(mouseX * getWindowWidth(), mouseY * getWindowHeight() );

				Client* client = getClientWithId( clientid );
				if( client ) {
					client->setMouseIsDown(mouseIsDown);
					client->setAltIsDown( altIsDown );
					client->setPosition( mousePosition );
				} else {
					// Don't have this client, add it
					addClientWithId( clientid );
				}

			} else if ( command == "drop" ) {
				Client* client = removeClientWithId( message.getArgAsString(1) );

			} else {
				console() << "Do not know how to handle command: " << command << std::endl;
				continue;
			}
	}

	updateClients();
}

void BasicBox2DApp::updateClients() {
	for (vector<Client*>::const_iterator iter = _allClients.begin(); iter != _allClients.end(); ++iter) {
		Client* client = (*iter);
		client->update();
	}
}

void BasicBox2DApp::debugOutputAllOSC() {
	while (listener.hasWaitingMessages()) {
			osc::Message message;
			listener.getNextMessage(&message);
			debugOutputSingleOSCMessage(message);
	}
}

void BasicBox2DApp::debugOutputSingleOSCMessage( osc::Message message ) {
	console() << "New message received" << std::endl;
	console() << "Address: " << message.getAddress() << std::endl;
	console() << "Num Arg: " << message.getNumArgs() << std::endl;
	for (int i = 0; i < message.getNumArgs(); i++) {
		console() << "-- Argument " << i << std::endl;
		console() << "---- type: " << message.getArgTypeName(i) << std::endl;
		if (message.getArgType(i) == osc::TYPE_INT32){
			try {
				console() << "------ value: "<< message.getArgAsInt32(i) << std::endl;
			}
			catch (...) {
				console() << "Exception reading argument as int32" << std::endl;
			}

		}else if (message.getArgType(i) == osc::TYPE_FLOAT){
			try {
				console() << "------ value: " << message.getArgAsFloat(i) << std::endl;
			}
			catch (...) {
				console() << "Exception reading argument as float" << std::endl;
			}
		}else if (message.getArgType(i) == osc::TYPE_STRING){
			try {
				console() << "------ value: " << message.getArgAsString(i).c_str() << std::endl;
			}
			catch (...) {
				console() << "Exception reading argument as string" << std::endl;
			}

		}
	}
}
void BasicBox2DApp::addBox( ci::Vec2f position )
{
	BoxElement* b = new BoxElement( position, Vec2f( Rand::randFloat(50.0f,200.0f), Rand::randFloat(50.0f,200.0f) ) );
	b->setColor( Color( CM_HSV, Rand::randFloat(0.0f,0.19f) + 180, 0.9f, 1.0f  ) );
	mSandbox.addElement(b);
}

void BasicBox2DApp::draw()
{
	gl::clear( Color::white() );
	gl::enableAlphaBlending();

	//draw all physics elements
	mSandbox.draw();
	//only draw the contact points in debug
//	mSandbox.debugDraw(false, true);

	gl::drawString( "Framerate: " + toString(getAverageFps()), Vec2f( 10.0f, 10.0f ), Color::black(), mFont );
	gl::drawString( "Num bodies: " + toString(mSandbox.getBodyCount() ), Vec2f( 10.0f, 22.0f ), Color::black(), mFont );
	gl::drawString( "Num contacts: " + toString(mSandbox.getContactCount() ), Vec2f( 10.0f, 34.0f ), Color::black(), mFont );

//	params::InterfaceGl::draw();
}


std::string BasicBox2DApp::getClientIdFromMessage( std::string address ) {
    std::string prefix = "/nodejs/";
    return address.substr(prefix.size());;
}

Client* BasicBox2DApp::getClientWithId( std::string clientid )
{
	for (vector<Client*>::const_iterator iter = _allClients.begin(); iter != _allClients.end(); ++iter) {
	    if( (*iter)->getId() == clientid ) {
	    	return (*iter);
	    }
	}
	return NULL;
}
Client* BasicBox2DApp::addClientWithId( std::string clientid ) {
	Client* aClient = new Client( clientid, "abc" );
	aClient->setWorld( mSandbox.getWorld() );
	_allClients.push_back( aClient );

	return aClient;
}
Client* BasicBox2DApp::removeClientWithId( std::string clientid ) {

	Client*	removedClient = NULL;
	vector<Client*>::iterator iter = _allClients.begin();
	while ( iter != _allClients.end() ) {
		if( (*iter)->getId() == clientid ) {
			removedClient = (*iter);
			iter = _allClients.erase(iter);
			console() << "Removing client: " << clientid << std::endl;
		} else {
			++iter;
		}
	}

	return removedClient;
}


// This line tells Cinder to actually create the application
CINDER_APP_BASIC( BasicBox2DApp, RendererGl(1) )
