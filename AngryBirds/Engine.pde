import shiffman.box2d.*;

import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

import processing.core.PApplet;
class Engine {
    // No real documentation for Box2D in processing. But there is a github wiith all functions, you just need to figure it out
    // https://github.com/shiffman/Box2D-for-Processing/blob/main/Box2D-for-Processing/src/shiffman/box2d/Box2DProcessing.java
    Box2DProcessing physics;
    
    // the base class (where setup(), etc comes. needed for Box2D instantiation)
    PApplet parent;
    
    

    Engine(PApplet p) {
        parent = p;

        physics = new Box2DProcessing(parent);
        physics.createWorld();
        physics.setGravity(0, -50);
        physics.listenForCollisions();

        // Remembers collisions forces previously
        physics.world.setWarmStarting(true);
        // Makes physics continuous (not frame by frame) through shady calculations
        physics.world.setContinuousPhysics(true);
    }

    void update() {
        physics.step();
    }

    Body createGround(float x, float y, float w, float h) {
        BodyDef bd = new BodyDef();
        bd.position = physics.coordPixelsToWorld(x, y);

        Body body = physics.world.createBody(bd);

        PolygonShape ps = new PolygonShape();

        float W = physics.scalarPixelsToWorld(w / 2);
        float H = physics.scalarPixelsToWorld(h / 2);

        ps.setAsBox(W, H);

        FixtureDef fd = new FixtureDef();
        fd.shape = ps;
        fd.density = 1;
        fd.friction = 0.5;
        // bounciness
        fd.restitution = 0.2;

        body.createFixture(fd);

        return body;
    }

     Body createBox(float x, float y, float w, float h, float density) {
        BodyDef bd = new BodyDef();
        bd.type = BodyType.DYNAMIC;
        bd.position = physics.coordPixelsToWorld(x, y);
        Body body = physics.world.createBody(bd);

        PolygonShape box = new PolygonShape();
        float W = physics.scalarPixelsToWorld(w / 2);
        float H = physics.scalarPixelsToWorld(h / 2);
        box.setAsBox(W, H);

        FixtureDef fd = new FixtureDef();
        fd.shape = box;
        fd.density = 1;
        fd.friction = 0.4;
        fd.restitution = 0.3;
        body.createFixture(fd);

        return body;
        }

    Body createCircle(float x, float y, float r, float density) {
        BodyDef bd = new BodyDef();
        bd.type = BodyType.DYNAMIC;
        bd.position = physics.coordPixelsToWorld(x, y);
        Body body = physics.world.createBody(bd);

        CircleShape c = new CircleShape();
        c.setRadius(physics.scalarPixelsToWorld(r));

        FixtureDef fd = new FixtureDef();
        fd.shape = c;
        fd.density = 1;
        fd.friction = 0.1;
        fd.restitution = 0.4;
        body.createFixture(fd);

        return body;
    }

    void applyForce(Body body, Vec2 force) {
      body.applyLinearImpulse(
          force,
          body.getWorldCenter(),
          true
      );
    }

    void destroyBody(Body body) {
        physics.destroyBody(body);
    }
    
    void displayBox(Body body, float w, float h){ //should NOT be in the engine class, but we're testing and i need to see if collisions and stuff works
        Vec2 pos = physics.getBodyPixelCoord(body);
        float angle = body.getAngle();
        
        pushMatrix();
        
        translate(pos.x, pos.y);
        rotate(-angle);
        
        fill(100);
        stroke(0);
        rectMode(CENTER);
        
        rect(0, 0, w, h);
        
        popMatrix();
    
    }
    
    
    void displayCircle(Body body, float r) { // same note as displayBox()
        Vec2 pos = physics.getBodyPixelCoord(body);
    
        fill(100);
        stroke(0);
        ellipseMode(RADIUS);
        ellipse(pos.x, pos.y, r, r);
    }
}
