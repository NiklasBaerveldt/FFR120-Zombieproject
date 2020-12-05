function [x,y]=Bresenham(x1,y1,x2,y2)

  dx = x2-x1;
  dy = y2-y1;
  x = [];
  y = [];

  if abs(dx) > abs(dy)
    deltaerr = abs(dy / dx);
    error = 0;
    j = y1;
    i = x1;
    while i ~= x2
      x = [x; i];
      y = [y; j];
      if error >= -1
        j = j + sign(dy);
        error = error - 1;
      end
      i = i + sign(dx);
      error = error + deltaerr;
    end
    
  else
    deltaerr = abs(dx / dy);
    error = 0;
    j = x1;
    i = y1;
    while i ~= y2
      x = [x; j];
      y = [y; i];
      if error >= -1
        j = j +sign(dx);
        error = error - 1;
      end
        i = i + sign(dy);
        error = error + deltaerr;
    end
  end
end