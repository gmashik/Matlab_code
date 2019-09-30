% Function myrk4 is for 7.5(a)
% The coding style following matlab command as the problem say to do

function [tout,yout] = myrk4(F,tspan,y0,dh,varargin)

h = 1.e-4; 
plotfun = @odeplot;
if nargin >= 4 && isnumeric(dh)
   h = dh;
end


t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
plotit = (nargout == 0);
t = t0;
y = y0(:);

% Make F callable by feval.

if ischar(F) & exist(F)~=2
   F = inline(F,'t','y');
elseif isa(F,'sym')
   F = inline(char(F),'t','y');
end 

% Initialize output.

if plotit
   feval(plotfun,tspan,y,'init');
else
   tout = t;
   yout = y.';
end

% The main loop
%
while t ~= tfinal
  
 
  k1 = feval(F, t, y, varargin{:});

  if 1.1*abs(h) >= abs(tfinal - t)
    h = tfinal - t;
  end
  
  % Evaluate the remaining slopes: 
  k2 = feval(F, t+h/2, y+(h/2)*k1, varargin{:});
  k3 = feval(F, t+h/2, y+(h/2)*k2, varargin{:});
  k4 = feval(F, t+h, y+h*k3, varargin{:});
   
  % Attempt a step.
  tnew = t + h;
  ynew = y + h*(k1 + 2*k2 + 2*k3 + k4)/6;
 
  tout(end+1,1) = tnew; 
  yout(end+1,:) = ynew.';
  
  t = tnew;
  y = ynew;
end

if plotit
   feval(plotfun,[],[],'done');
end