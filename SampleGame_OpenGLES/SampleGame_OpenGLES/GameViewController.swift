//
//  GameViewController.swift
//  SampleGame_OpenGLES
//
//  Created by Tim Fuqua on 12/30/14.
//  Copyright (c) 2014 FuquaProductions. All rights reserved.
//

/*
NOTE: The OpenGL ES option is still in progress for Swift.

import GLKit
import OpenGLES

/*
#define BUFFER_OFFSET(i) ((char *)NULL + (i))

// Uniform index.
enum
{
UNIFORM_MODELVIEWPROJECTION_MATRIX,
UNIFORM_NORMAL_MATRIX,
NUM_UNIFORMS
};
GLint uniforms[NUM_UNIFORMS];

// Attribute index.
enum
{
ATTRIB_VERTEX,
ATTRIB_NORMAL,
NUM_ATTRIBUTES
};
*/

class GameViewController: GLKViewController {

    var program: GLuint = 0

    var modelViewProjectionMatrix: GLKMatrix4 = GLKMatrix4Identity
    var normalMatrix: GLKMatrix3 = GLKMatrix3Identity
    var rotation: Float = 0.0

    var vertexArray: GLuint = 0
    var vertexBuffer: GLuint = 0

    var context: EAGLContext? = nil
    var effect: GLKBaseEffect? = nil

    deinit {
        self.tearDownGL()

        if EAGLContext.currentContext() === self.context {
            EAGLContext.setCurrentContext(nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.context = EAGLContext(withAPI: .OpenGLES2)

        if !self.context {
            println("Failed to create ES context")
        }

        let view = self.view as GLKView
        view.context = self.context
        view.drawableDepthFormat = .Format24
        
        self.setupGL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        if self.isViewLoaded() && !self.view.window {
            self.view = nil

            self.tearDownGL()

            if EAGLContext.currentContext() === self.context {
                EAGLContext.setCurrentContext(nil)
            }
            self.context = nil
        }
    }

    func setupGL() {
        EAGLContext.setCurrentContext(self.context)

        self.loadShaders()

        self.effect = GLKBaseEffect()
        self.effect!.light0.enabled = /*GL_TRUE*/1
        //self.effect!.light0.diffuseColor = GLKVector4Make(1.0, 0.4, 0.4, 1.0)

        glEnable(/*GL_DEPTH_TEST*/0x0B71)

        glGenVertexArraysOES(1, &vertexArray)
        glBindVertexArrayOES(vertexArray)

        glGenBuffers(1, &vertexBuffer)
        glBindBuffer(/*GL_ARRAY_BUFFER*/0x8892, vertexBuffer)
        // Not working...
        //glBufferData(/*GL_ARRAY_BUFFER*/0x8892, sizeof(gCubeVertexData), gCubeVertexData, /*GL_STATIC_DRAW*/0x88E4)

        glEnableVertexAttribArray(GLuint(GLKVertexAttrib.Position.rawValue))
        // Not working...
        //glVertexAttribPointer(GLuint(GLKVertexAttrib.Position.rawValue), 3, GL_FLOAT, GL_FALSE, 24, BUFFER_OFFSET(0))
        glEnableVertexAttribArray(GLuint(GLKVertexAttrib.Normal.rawValue))
        // Not working...
        //glVertexAttribPointer(GLKVertexAttrib.Normal, 3, GL_FLOAT, GL_FALSE, 24, BUFFER_OFFSET(12))
        
        glBindVertexArrayOES(0);
    }

    func tearDownGL() {
        EAGLContext.setCurrentContext(self.context)

        glDeleteBuffers(1, &vertexBuffer)
        glDeleteVertexArraysOES(1, &vertexArray)

        self.effect = nil

        if program != 0 {
            glDeleteProgram(program)
            program = 0
        }
    }

    // MARK: - GLKView and GLKViewController delegate methods

    func update() {
        /* Not working...
        let aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height)
        let projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0), aspect, 0.1, 100.0)

        self.effect.transform.projectionMatrix = projectionMatrix

        let baseModelViewMatrix = GLKMatrix4MakeTranslation(0.0, 0.0, -4.0)
        baseModelViewMatrix = GLKMatrix4Rotate(baseModelViewMatrix, _rotation, 0.0, 1.0, 0.0)

        // Compute the model view matrix for the object rendered with GLKit
        let modelViewMatrix = GLKMatrix4MakeTranslation(0.0, 0.0, -1.5)
        modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, _rotation, 1.0, 1.0, 1.0)
        modelViewMatrix = GLKMatrix4Multiply(baseModelViewMatrix, modelViewMatrix)

        self.effect.transform.modelviewMatrix = modelViewMatrix

        // Compute the model view matrix for the object rendered with ES2
        modelViewMatrix = GLKMatrix4MakeTranslation(0.0, 0.0, 1.5)
        modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, _rotation, 1.0, 1.0, 1.0)
        modelViewMatrix = GLKMatrix4Multiply(baseModelViewMatrix, modelViewMatrix)

        normalMatrix = GLKMatrix3InvertAndTranspose(GLKMatrix4GetMatrix3(modelViewMatrix), NULL)

        modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix)
        
        rotation += self.timeSinceLastUpdate * 0.5
        */
    }

    override func glkView(view: GLKView, drawInRect rect: CGRect) {
        glClearColor(0.65, 0.65, 0.65, 1.0)
        glClear(/*GL_COLOR_BUFFER_BIT*/0x00004000 | /*GL_DEPTH_BUFFER_BIT*/0x00000100)

        glBindVertexArrayOES(vertexArray)

        // Render the object with GLKit
        self.effect?.prepareToDraw()

        glDrawArrays(/*GL_TRIANGLES*/0x0004, 0, 36)

        // Render the object again with ES2
        glUseProgram(program)

        // Not working...
        //glUniformMatrix4fv(uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX], 1, 0, modelViewProjectionMatrix.m)
        //glUniformMatrix3fv(uniforms[UNIFORM_NORMAL_MATRIX], 1, 0, normalMatrix.m)

        glDrawArrays(/*GL_TRIANGLES*/0x0004, 0, 36)
    }

    // MARK: -  OpenGL ES 2 shader compilation

    func loadShaders() -> Bool {
        var vertShader: GLuint = 0
        var fragShader: GLuint = 0
        var vertShaderPathname: String
        var fragShaderPathname: String

        // Create shader program.
        program = glCreateProgram()

        // Create and compile vertex shader.
        vertShaderPathname = NSBundle.mainBundle().pathForResource("Shader", ofType: "vsh")
        if !self.compileShader(&vertShader, type: /*GL_VERTEX_SHADER*/0x8B31, file: vertShaderPathname) {
            println("Failed to compile vertex shader")
            return false
        }

        // Create and compile fragment shader.
        fragShaderPathname = NSBundle.mainBundle().pathForResource("Shader", ofType: "fsh")
        if !self.compileShader(&fragShader, type: /*GL_FRAGMENT_SHADER*/0x8B30, file: fragShaderPathname) {
            println("Failed to compile fragment shader");
            return false
        }

        // Attach vertex shader to program.
        glAttachShader(program, vertShader)

        // Attach fragment shader to program.
        glAttachShader(program, fragShader)

        // Bind attribute locations.
        // This needs to be done prior to linking.
        glBindAttribLocation(program, GLuint(GLKVertexAttrib.Position.rawValue), "position")
        glBindAttribLocation(program, GLuint(GLKVertexAttrib.Normal.rawValue), "normal")

        // Link program.
        if !self.linkProgram(program) {
            println("Failed to link program: \(program)")

            if vertShader != 0 {
                glDeleteShader(vertShader)
                vertShader = 0
            }
            if fragShader != 0 {
                glDeleteShader(fragShader)
                fragShader = 0
            }
            if program != 0 {
                glDeleteProgram(program)
                program = 0
            }
            
            return false
        }

        // Get uniform locations.
        // Not working...
        //uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX] = glGetUniformLocation(program, "modelViewProjectionMatrix")
        //uniforms[UNIFORM_NORMAL_MATRIX] = glGetUniformLocation(program, "normalMatrix")

        // Release vertex and fragment shaders.
        if vertShader != 0 {
            glDetachShader(program, vertShader)
            glDeleteShader(vertShader);
        }
        if fragShader != 0 {
            glDetachShader(program, fragShader);
            glDeleteShader(fragShader);
        }
        
        return true
    }


    func compileShader(inout shader: GLuint, type type: GLenum, file file: String) -> Bool {
        /* Not working...
        var status: GLint
        let source = NSString.stringWithContentsOfFile(file, encoding: NSUTF8StringEncoding, error: nil).UTF8String
        if !source {
            println("Failed to load vertex shader")
            return false
        }

        shader = glCreateShader(type)
        glShaderSource(shader, 1, source, nil)
        glCompileShader(shader)

//        #if defined(DEBUG)
//            GLint logLength;
//            glGetShaderiv(*shader, GL_INFO_LOG_LENGTH, &logLength);
//            if (logLength > 0) {
//            GLchar *log = (GLchar *)malloc(logLength);
//            glGetShaderInfoLog(*shader, logLength, &logLength, log);
//            NSLog(@"Shader compile log: \n%s", log);
//            free(log);
//            }
//        #endif

        glGetShaderiv(shader, /*GL_COMPILE_STATUS*/0x8B81, &status)
        if status == 0 {
            glDeleteShader(shader);
            return false
        }
        */
        return true
    }

    func linkProgram(prog: GLuint) -> Bool {
        var status: GLint = 0
        glLinkProgram(prog)

//        #if defined(DEBUG)
//            GLint logLength;
//            glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
//            if (logLength > 0) {
//            GLchar *log = (GLchar *)malloc(logLength);
//            glGetProgramInfoLog(prog, logLength, &logLength, log);
//            NSLog(@"Program link log: \n%s", log);
//            free(log);
//            }
//        #endif

        glGetProgramiv(prog, /*GL_LINK_STATUS*/0x8B82, &status)
        if status == 0 {
            return false
        }
        
        return true
    }

    func validateProgram(prog: GLuint) -> Bool {
        /* Not working...
        var logLength: GLint
        var status: GLint

        glValidateProgram(prog)
        glGetProgramiv(prog, /*GL_INFO_LOG_LENGTH*/0x8B84, &logLength)
        if logLength > 0 {
            let log = malloc(UInt(logLength))
            glGetProgramInfoLog(prog, logLength, &logLength, log)
            println("Program validate log: \n\(log)")
            free(log)
        }

        glGetProgramiv(prog, GL_VALIDATE_STATUS, &status)
        if status == 0 {
            return false
        }
        */
        return true
    }

}

let gCubeVertexData: GLfloat[] = [
    // Data layout for each line below is:
    // positionX, positionY, positionZ,     normalX, normalY, normalZ,
    0.5, -0.5, -0.5,        1.0, 0.0, 0.0,
    0.5, 0.5, -0.5,         1.0, 0.0, 0.0,
    0.5, -0.5, 0.5,         1.0, 0.0, 0.0,
    0.5, -0.5, 0.5,         1.0, 0.0, 0.0,
    0.5, 0.5, -0.5,         1.0, 0.0, 0.0,
    0.5, 0.5, 0.5,          1.0, 0.0, 0.0,

    0.5, 0.5, -0.5,         0.0, 1.0, 0.0,
    -0.5, 0.5, -0.5,        0.0, 1.0, 0.0,
    0.5, 0.5, 0.5,          0.0, 1.0, 0.0,
    0.5, 0.5, 0.5,          0.0, 1.0, 0.0,
    -0.5, 0.5, -0.5,        0.0, 1.0, 0.0,
    -0.5, 0.5, 0.5,         0.0, 1.0, 0.0,

    -0.5, 0.5, -0.5,        -1.0, 0.0, 0.0,
    -0.5, -0.5, -0.5,      -1.0, 0.0, 0.0,
    -0.5, 0.5, 0.5,         -1.0, 0.0, 0.0,
    -0.5, 0.5, 0.5,         -1.0, 0.0, 0.0,
    -0.5, -0.5, -0.5,      -1.0, 0.0, 0.0,
    -0.5, -0.5, 0.5,        -1.0, 0.0, 0.0,
/*
    -0.5, -0.5, -0.5,      0.0, -1.0, 0.0,
    0.5, -0.5, -0.5,        0.0, -1.0, 0.0,
    -0.5, -0.5, 0.5,        0.0, -1.0, 0.0,
    -0.5, -0.5, 0.5,        0.0, -1.0, 0.0,
    0.5, -0.5, -0.5,        0.0, -1.0, 0.0,
    0.5, -0.5, 0.5,         0.0, -1.0, 0.0,

    0.5, 0.5, 0.5,          0.0, 0.0, 1.0,
    -0.5, 0.5, 0.5,         0.0, 0.0, 1.0,
    0.5, -0.5, 0.5,         0.0, 0.0, 1.0,
    0.5, -0.5, 0.5,         0.0, 0.0, 1.0,
    -0.5, 0.5, 0.5,         0.0, 0.0, 1.0,
    -0.5, -0.5, 0.5,        0.0, 0.0, 1.0,

    0.5, -0.5, -0.5,        0.0, 0.0, -1.0,
    -0.5, -0.5, -0.5,      0.0, 0.0, -1.0,
    0.5, 0.5, -0.5,         0.0, 0.0, -1.0,
    0.5, 0.5, -0.5,         0.0, 0.0, -1.0,
    -0.5, -0.5, -0.5,      0.0, 0.0, -1.0,
    -0.5, 0.5, -0.5,        0.0, 0.0, -1.0
*/
]
*/
