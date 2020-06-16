function ngon(n, x, y, d) {
  beginShape(TESS);
  for (let i = 0; i < n + 1; i++) {
    angle = TWO_PI / n * i;
    px = x + sin(angle) * d / 2;
    py = y - cos(angle) * d / 2;
    vertex(px, py, 0);
  }
  for (let i = 0; i < n + 1; i++) {
    angle = TWO_PI / n * i;
    px = x + sin(angle) * d / 4;
    py = y - cos(angle) * d / 4;
    vertex(px, py, 0);
  }
  endShape();
}