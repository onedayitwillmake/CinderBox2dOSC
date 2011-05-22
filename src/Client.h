/*
 * Clientt.h
 *
 *  Created on: May 22, 2011
 *      Author: onedayitwillmake
 */

#ifndef CLIENT_H_
#define CLIENT_H_
#include "cinder/Vector.h"

class Client
{
public:
	Client( std::string id, std::string name );
	~Client();

	void		setPosition( ci::Vec2f aPosition ) { _position = aPosition; };

	void		setAltIsDown( bool value ) { _altIsDown = value; };
	bool		getAltIsDown() { return _altIsDown; };

	void		setMouseIsDown( bool value ) { _mouseIsDown = value; };
	bool		getMouseIsDown() { return _mouseIsDown; };

	void		setId( std::string anId ) { _id = anId; };
	std::string	getId() { return _id; };

	void		setName( std::string value ) { _name = value; };
	std::string	getName() { return _name; };

private:
	ci::Vec2f	_position;
	bool		_altIsDown;
	bool 		_mouseIsDown;
	std::string _id;
	std::string _name;
};

#endif /* CLIENT_H_ */
