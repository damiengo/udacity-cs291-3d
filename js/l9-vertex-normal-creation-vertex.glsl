varying vec3 vNormal;
varying vec3 vViewPosition;

uniform float uSphereRadius2;        // squared

void main() {
  // make a local variable we can modify
   vec3 newPosition = position;
   // set the position to be on a sphere centered at the origin
   newPosition.z = sqrt(uSphereRadius2 -
          newPosition.x * newPosition.x - newPosition.y * newPosition.y);
   // set the normal to be identical (results from it will be normalized later)
   vec3 newNormal = newPosition;
   // Offset the surface so the center stays in view; do after the normal is set.
   newPosition.z -= sqrt(uSphereRadius2);
   gl_Position = projectionMatrix * modelViewMatrix * vec4( newPosition, 1.0 );
   vNormal = normalize( normalMatrix * newNormal );
   vec4 mvPosition = modelViewMatrix * vec4( newPosition, 1.0 );
   vViewPosition = -mvPosition.xyz;
}
