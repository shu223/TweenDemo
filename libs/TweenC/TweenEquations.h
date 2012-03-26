/**
 
 Disclaimer for Robert Penner's Easing Equations license:
 
 TERMS OF USE - EASING EQUATIONS
 
 Open source under the BSD License.
 
 Copyright © 2001 Robert Penner
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the 
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
**/


/**
 * Easing equation function for a simple linear tweening, with no easing.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double easeNone (double t, double b, double c, double d) {
	return c*t/d + b;
}

/**
 * Easing equation function for a quadratic (t^2) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInQuad (double t, double b, double c, double d) {
	return c*(t/=d)*t + b;
}

/**
 * Easing equation function for a quadratic (t^2) easing out: decelerating to zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutQuad (double t, double b, double c, double d) {
	return -c *(t/=d)*(t-2) + b;
}

/**
 * Easing equation function for a quadratic (t^2) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutQuad (double t, double b, double c, double d) {
	if ((t/=d/2) < 1) return c/2*t*t + b;
	return -c/2 * ((--t)*(t-2) - 1) + b;
}

/**
 * Easing equation function for a quadratic (t^2) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInQuad (double t, double b, double c, double d) {
 if (t < d/2) return easeOutQuad (t*2, b, c/2, d, p_params);
 return easeInQuad((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a cubic (t^3) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInCubic (double t, double b, double c, double d) {
	return c*(t/=d)*t*t + b;
}

/**
 * Easing equation function for a cubic (t^3) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutCubic (double t, double b, double c, double d) {
	return c*((t=t/d-1)*t*t + 1) + b;
}

/**
 * Easing equation function for a cubic (t^3) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutCubic (double t, double b, double c, double d) {
	if ((t/=d/2) < 1) return c/2*t*t*t + b;
	return c/2*((t-=2)*t*t + 2) + b;
}

/**
 * Easing equation function for a cubic (t^3) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInCubic (double t, double b, double c, double d) {
 if (t < d/2) return easeOutCubic (t*2, b, c/2, d, p_params);
 return easeInCubic((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a quartic (t^4) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInQuart (double t, double b, double c, double d) {
	return c*(t/=d)*t*t*t + b;
}

/**
 * Easing equation function for a quartic (t^4) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutQuart (double t, double b, double c, double d) {
	return -c * ((t=t/d-1)*t*t*t - 1) + b;
}

/**
 * Easing equation function for a quartic (t^4) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutQuart (double t, double b, double c, double d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
	return -c/2 * ((t-=2)*t*t*t - 2) + b;
}

/**
 * Easing equation function for a quartic (t^4) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInQuart (double t, double b, double c, double d) {
 if (t < d/2) return easeOutQuart (t*2, b, c/2, d, p_params);
 return easeInQuart((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a quintic (t^5) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInQuint (double t, double b, double c, double d) {
	return c*(t/=d)*t*t*t*t + b;
}

/**
 * Easing equation function for a quintic (t^5) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutQuint (double t, double b, double c, double d) {
	return c*((t=t/d-1)*t*t*t*t + 1) + b;
}

/**
 * Easing equation function for a quintic (t^5) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutQuint (double t, double b, double c, double d) {
	if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
	return c/2*((t-=2)*t*t*t*t + 2) + b;
}

/**
 * Easing equation function for a quintic (t^5) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInQuint (double t, double b, double c, double d) {
 if (t < d/2) return easeOutQuint (t*2, b, c/2, d, p_params);
 return easeInQuint((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a sinusoidal (sin(t)) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInSine (double t, double b, double c, double d) {
	return -c * cos(t/d * (M_PI/2)) + c + b;
}

/**
 * Easing equation function for a sinusoidal (sin(t)) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutSine (double t, double b, double c, double d) {
	return c * sin(t/d * (M_PI/2)) + b;
}

/**
 * Easing equation function for a sinusoidal (sin(t)) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutSine (double t, double b, double c, double d) {
	return -c/2 * (cos(M_PI*t/d) - 1) + b;
}

/**
 * Easing equation function for a sinusoidal (sin(t)) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInSine (double t, double b, double c, double d) {
 if (t < d/2) return easeOutSine (t*2, b, c/2, d, p_params);
 return easeInSine((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for an exponential (2^t) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInExpo (double t, double b, double c, double d) {
	return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b - c * 0.001;
}

/**
 * Easing equation function for an exponential (2^t) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutExpo (double t, double b, double c, double d) {
	return (t==d) ? b+c : c * 1.001 * (-pow(2, -10 * t/d) + 1) + b;
}

/**
 * Easing equation function for an exponential (2^t) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutExpo (double t, double b, double c, double d) {
	if (t==0) return b;
	if (t==d) return b+c;
	if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b - c * 0.0005;
	return c/2 * 1.0005 * (-pow(2, -10 * --t) + 2) + b;
}

/**
 * Easing equation function for an exponential (2^t) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInExpo (double t, double b, double c, double d) {
 if (t < d/2) return easeOutExpo (t*2, b, c/2, d, p_params);
 return easeInExpo((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a circular (sqrt(1-t^2)) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInCirc (double t, double b, double c, double d) {
	return -c * (sqrt(1 - (t/=d)*t) - 1) + b;
}

/**
 * Easing equation function for a circular (sqrt(1-t^2)) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeOutCirc (double t, double b, double c, double d) {
	return c * sqrt(1 - (t=t/d-1)*t) + b;
}

/**
 * Easing equation function for a circular (sqrt(1-t^2)) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutCirc (double t, double b, double c, double d) {
	if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
	return c/2 * (sqrt(1 - (t-=2)*t) + 1) + b;
}

/**
 * Easing equation function for a circular (sqrt(1-t^2)) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
/*
 double  easeOutInCirc (double t, double b, double c, double d) {
 if (t < d/2) return easeOutCirc (t*2, b, c/2, d, p_params);
 return easeInCirc((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */
/**
 * Easing equation function for an elastic (exponentially decaying sine wave) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param a		Amplitude.
 * @param p		Period.
 * @return		The correct value.
 */

double  easeInElastic (double t, double b, double c, double d) {
	if (t==0) return b;
	if ((t/=d)==1) return b+c;
	float p = d*.3;
	int s;
	int a = 0;
	if (a < abs(c)) {
		a = c;
		s = p/4;
	} else {
		s = p/(2*M_PI) * asin (c/a);
	}
	return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
}


/**
 * Easing equation function for an elastic (exponentially decaying sine wave) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param a		Amplitude.
 * @param p		Period.
 * @return		The correct value.
 */

double  easeOutElastic (double t, double b, double c, double d) {
	if (t==0)		return b;
	if ((t/=d)==1)	return b+c;
	
	//var p:Number = !Boolean(p_params) || isNaN(p_params.period) ? d*.3 : p_params.period;
	float p = d*0.3;
	//var s:Number;
	int s;
	//var a:Number = !Boolean(p_params) || isNaN(p_params.amplitude) ? 0 : p_params.amplitude;
	int a = 0;
	//if (!Boolean(a) || a < abs(c)) {
	if( a < abs(c)){
		a = c;
		s = p/4;
	} else {
		s = p/(2*M_PI) * asin (c/a);
	}
	return (a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c + b);
}


/**
 * Easing equation function for an elastic (exponentially decaying sine wave) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param a		Amplitude.
 * @param p		Period.
 * @return		The correct value.
 */

double  easeInOutElastic (double t, double b, double c, double d) {
	if (t==0) return b;
	if ((t/=d/2)==2) return b+c;
	float p = d*(.3*1.5);
	int s = 0;
	int a = 0;
	if (a < abs(c)) {
		a = c;
		s = p/4;
	} else {
		s = p/(2*M_PI) * asin (c/a);
	}
	if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )) + b;
	return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c + b;
}


/**
 * Easing equation function for an elastic (exponentially decaying sine wave) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param a		Amplitude.
 * @param p		Period.
 * @return		The correct value.
 */
/*
 double  easeOutInElastic (double t, double b, double c, double d) {
 if (t < d/2) return easeOutElastic (t*2, b, c/2, d, p_params);
 return easeInElastic((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */

/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param s		Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
 * @return		The correct value.
 */

double  easeInBack (double t, double b, double c, double d) {
	//var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
	int s = 1.70158;
	return c*(t/=d)*t*((s+1)*t - s) + b;
}


/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param s		Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
 * @return		The correct value.
 */

double  easeOutBack (double t, double b, double c, double d) {
	//var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
	int s = 1.70158;
	return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
}

/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param s		Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
 * @return		The correct value.
 */

double  easeInOutBack (double t, double b, double c, double d) {
	//var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
	int s = 1.70158;
	if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
	return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}


/**
 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2) easing out/in: deceleration until halfway, then acceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @param s		Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent).
 * @return		The correct value.
 */
/*
 double  easeOutInBack (double t, double b, double c, double d) {
 if (t < d/2) return easeOutBack (t*2, b, c/2, d, p_params);
 return easeInBack((t*2)-d, b+c/2, c/2, d, p_params);
 }
 */



/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing out: decelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double easeOutBounce (double t, double b, double c, double d)
{
	if ((t/=d) < (1/2.75)) {
		return c*(7.5625*t*t) + b;
	} else if (t < (2/2.75)) {
		return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
	} else if (t < (2.5/2.75)) {
		return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
	} else {
		return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
	}
}

/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in: accelerating from zero velocity.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInBounce (double t, double b, double c, double d) {
	return c - easeOutBounce (d-t, 0, c, d) + b;
}

/**
 * Easing equation function for a bounce (exponentially decaying parabolic bounce) easing in/out: acceleration until halfway, then deceleration.
 *
 * @param t		Current time (in frames or seconds).
 * @param b		Starting value.
 * @param c		Change needed in value.
 * @param d		Expected easing duration (in frames or seconds).
 * @return		The correct value.
 */
double  easeInOutBounce (double t, double b, double c, double d) {
	if (t < d/2) return easeInBounce (t*2, 0, c, d) * .5 + b;
	else return easeOutBounce (t*2-d, 0, c, d) * .5 + c*.5 + b;
}
