//
//  Shader.fsh
//  SampleGame_OpenGLES
//
//  Created by Tim Fuqua on 12/30/14.
//  Copyright (c) 2014 FuquaProductions. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
