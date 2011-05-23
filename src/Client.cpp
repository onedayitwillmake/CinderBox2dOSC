/*
 * Client.cpp
 *
 *  Created on: May 22, 2011
 *      Author: onedayitwillmake
 */

#include "Client.h"
#include "cinder/Rand.h"
#include "cinder/Color.h"
#include "b2cinder/Conversions.h"
#include "b2cinder/BoxElement.h"

Client::Client( std::string id, std::string name )
{
	_id = id;
	_name = name;
	_mouseIsDown = false;
	_altIsDown = false;
	mMouseJoint = NULL;
}

void Client::setWorld( b2World* world ) {
	_worldReference = world;
	b2BodyDef bodyDef;
	_groundBody = world->CreateBody(&bodyDef);
};

// QueryCallback taken from box2d testbed
class QueryCallback : public b2QueryCallback
{
public:
	QueryCallback(const b2Vec2& point)
	{
		m_point = point;
		m_fixture = NULL;
	}

	bool ReportFixture(b2Fixture* fixture)
	{
		b2Body* body = fixture->GetBody();
		if (body->GetType() == b2_dynamicBody)
		{
			bool inside = fixture->TestPoint(m_point);
			if (inside)
			{
				m_fixture = fixture;

				// We are done, terminate the query.
				return false;
			}
		}

		// Continue the query.
		return true;
	}

	b2Vec2 m_point;
	b2Fixture* m_fixture;
};

void Client::onMouseDown() {


	if(_altIsDown) {

		std::cout << "Creating joint" << std::endl;
		b2Vec2 p = ci::box2d::Conversions::toPhysics( _position );
		// Make a small box.
		b2AABB aabb;
		b2Vec2 d;
		d.Set(0.001f, 0.001f);
		aabb.lowerBound = p - d;
		aabb.upperBound = p + d;

		// Query the world for overlapping shapes.
		QueryCallback callback(p);
		_worldReference->QueryAABB(&callback, aabb);

		if (callback.m_fixture)
		{
			b2Body* body = callback.m_fixture->GetBody();
			b2MouseJointDef md;
			md.bodyA = _groundBody;
			md.bodyB = body;
			md.target = p;
			md.maxForce = 1000.0f * body->GetMass();
			mMouseJoint = (b2MouseJoint*)_worldReference->CreateJoint(&md);
			body->SetAwake(true);
		}
	} else {
		addBody();
	}
}

void Client::onMouseMove() {

}
void Client::onMouseDrag() {
	if(mMouseJoint){
		mMouseJoint->SetTarget( ci::box2d::Conversions::toPhysics( _position ) );
	}
}

void Client::onMouseUp() {
	if (mMouseJoint) {
		std::cout << "Destroying joint" << std::endl;
		_worldReference->DestroyJoint(mMouseJoint);
		mMouseJoint = NULL;
	}
}

void Client::addBody()
{
	//ci::Rand::randFloat(0.0f,0.19f)
	float hue = atof( _id.c_str() );
	if(hue < 0.0) hue += 2.0f; // HACK FOR LOCAL_CLIENT

	hue *= 0.03f;
	ci::box2d::BoxElement* b = new ci::box2d::BoxElement( _position, ci::Vec2f( ci::Rand::randFloat(10.0f,40.0f), ci::Rand::randFloat(10.0f,40.0f) ) );
	b->setColor( ci::Color( ci::CM_HSV, hue, 0.9f, 1.0f  ) );

	b2Body* mTempBody = _worldReference->CreateBody( b->getBodyDef() );

	// add all fixture defs
	std::list<b2FixtureDef>* defs = b->getFixtureDefs();
	for( std::list<b2FixtureDef>::iterator iter = defs->begin(); iter != defs->end(); ++iter ) {
		mTempBody->CreateFixture( &*(iter) );
	}

	// make a circular reference between PhysicsElement and b2Body
	b->setBody( mTempBody );
}


void Client::update() {
	static bool mouseWasDown = false;
	static bool altWasDown = false;

//	std::cout <<  "UPDATE:" << altWasDown << _altIsDown << std::endl;

	if( _mouseIsDown && !mouseWasDown ) {
		onMouseDown();
		mouseWasDown = true;
	} else if ( !_mouseIsDown && mouseWasDown ) {
		onMouseUp();
		mouseWasDown = false;
	}

	if(_mouseIsDown) {
		onMouseDrag();
	} else {
		onMouseMove();
	}
}

Client::~Client()
{
	// TODO Auto-generated destructor stub
}
