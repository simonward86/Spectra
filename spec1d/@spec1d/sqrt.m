function sout = sqrt(varargin)
%
% function r = sqrt(s1,s2)
%
% @SPEC1D/sqrt function to give the square root of spectrum s1...sn.
%
% Simon Ward 26/01/2016 - simon.ward@psi.ch
%

s1 = [varargin{:}];

for i=1:length(s1)
    if any(s1(i).y < 0)
        error('spec1d:sqrt:NegativeY','Some or all y-values in the input spec1d object are negative. spec1d does not support imaginary numbers.')
    end
    r = s1(i);
    r.x = s1(i).x;
    r.y = sqrt(s1(i).y);
    r.e = s1(i).e./(2*r.y);
    if ~isempty(s1(i).yfit)
        r.yfit=sqrt(s1(i).yfit);
    end
    sout(i) = spec1d(r);
end