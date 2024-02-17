function digCuboid(width: number, length: number, height: number) {
  for (let i = 0; i < height; i++) {
    digPlane(width, length);
    if (width % 2 == 0) {
      turtle.turnRight();
    } else {
      turtle.turnLeft();
      turtle.turnLeft();
    }
  }
}

function digPlane(width: number, length: number) {
  for (let i = 0; i < width; i++) {
    if (i == 0) {
      // nop
    } else if (i % 2 == 0) {
      turtle.turnLeft();
      turtle.dig();
      turtle.turnLeft();
    } else {
      turtle.turnRight();
      turtle.dig();
      turtle.turnRight();
    }
    digLine(length - 1);
  }
}

function digLine(length: number) {
  for (let i = 0; i < length - 1; i++) {
    turtle.dig();
    turtle.forward();
  }
}

export {
  digCuboid,
  digPlane,
  digLine
};