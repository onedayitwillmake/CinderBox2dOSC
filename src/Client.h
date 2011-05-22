/*
 * Clientt.h
 *
 *  Created on: May 22, 2011
 *      Author: onedayitwillmake
 */

#ifndef CLIENT_H_
#define CLIENT_H_
#include "cinder/Vector.h"
#include <Box2D/Box2D.h>

class Client
{
public:
	Client( std::string id, std::string name );
	~Client();

	void update();
	void addBody();

	void		setPosition( ci::Vec2f aPosition ) { _position = aPosition; };

	void		setAltIsDown( bool value ) { _altIsDown = value; };
	bool		getAltIsDown() { return _altIsDown; };

	void		setMouseIsDown( bool value ) { _mouseIsDown = value; };
	bool		getMouseIsDown() { return _mouseIsDown; };

	void		setId( std::string anId ) { _id = anId; };
	std::string	getId() { return _id; };

	void		setName( std::string value ) { _name = value; };
	std::string	getName() { return _name; };

	void		setWorld( b2World* world );

private:
	ci::Vec2f	_position;
	bool		_altIsDown;
	bool 		_mouseIsDown;
	std::string _id;
	std::string _name;

	b2World*		_worldReference;
	b2Body*			_groundBody;
	b2MouseJoint*	mMouseJoint;

	void		onMouseDown();
	void		onMouseMove();
	void		onMouseDrag();
	void		onMouseUp();
};

#endif /* CLIENT_H_ */
