float areaOfSphericalCapIntersection(float radiusA, float radiusB, float centerDist) {
  // No intersection
  if (centerDist >= radiusA + radiusB) return 0.0;

  float minRad = min(radiusA, radiusB);

  // One cap fully inside the other
  if (minRad <= max(radiusA, radiusB) - centerDist)
    return TWO_PI_F - (TWO_PI_F * cos(minRad));

  // Precompute sines and cosines once for reuse.
  float cosD = cos(centerDist);
  float sinD = sin(centerDist);

  float cosA = cos(radiusA);
  float sinA = sin(radiusA);

  float cosB = cos(radiusB);
  float sinB = sin(radiusB);

  float firstTerm = acos(clamp((cosD - cosA * cosB) / (sinA * sinB), -1.0, 1.0));
  float secondTerm = acos(clamp((cosB - cosD * cosA) / (sinD * sinA), -1.0, 1.0)) * cosA;
  float thirdTerm = acos(clamp((cosA - cosD * cosB) / (sinD * sinB), -1.0, 1.0)) * cosB;

  return 2.0 * (-firstTerm - secondTerm - thirdTerm + PI_F);
}