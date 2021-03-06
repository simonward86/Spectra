%% @spec1d/plus 
% This is the reference documentation for the function @spec1d/plus
%
% This function gives a new spectra with a value of spectra _s1_ plus a value or an addition of values from spectra _s1_ and _s2_.
%%

%% Syntax 
% 
%    s_out = plus(s1,s2)
%    s_out = s1 + s2
%    s_out = s1 + a
%    s_out = a + s1
%

%% Inputs
% 
% * _s1_ - spec1d object
% * _s2(a)_ - spec1d object or value
% 

%% Outputs
% 
% * _s_out_ - spec1d object

%% Notes
% 
% * If spectra are not the same length, _s2_ is interpolated to the x
% values of _s1_
% * @spec1d/plus should not be used to combine counts taken with different monitors - use combine(s1,s2)
% 

%% Examples
% These are some examples on using @spec1d/plus
% 
% <html><h3>Example 1</h3></html>
%
% Addition of spectra and value
%

s = spec1d(1:5,1:5,0.1);
s_1 = s + 5;
s_1 = 5 + s;

%%
% 
% <html><h3>Example 2</h3></html>
%
% Addition two spectra (equal points)
%

s2 = spec1d(1:5,2:6,0.15);
s_2 = s + s2;

%%
% 
% <html><h3>Example 3</h3></html>
%
% Addition two spectra (unequal points). This using interpolation on _s3_
%

s3 = spec1d(1:5 + 0.1,2:6,0.15);
s_3 = s + s3;

%% See Also
% <html><a href="{{ site.url }}/@spec1d.combine/index.html">Combine</a>, <a href="{{ site.url }}/@spec1d.minus/index.html">Minus</a></html>