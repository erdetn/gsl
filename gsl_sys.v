// Copyright(C) 2021 Erdet Nasufi. All rights reserved. MIT License.

module gsl 

fn C.gsl_log1p (x double) double
[inline]
pub fn log1p(x double) double {
	return C.gsl_log1p(x)
}

fn C.gsl_expm1 (x double) double
[inline]
pub fn expm1(x double) double {
	return C.gsl_expm1(x)
}

fn C.gsl_hypot (x double, y double) double
[inline]
pub fn hypot(x double, y double) double {
	return C.gsl_hypot(x, y)
}

fn C.gsl_hypot3 (x double, y double, z double) double
[inline]
pub fn hypot3(x double, y double, z double) double {
	return C.gsl_hypot3(x, y, z)
}

fn C.gsl_acosh (x double) double
[inline]
pub fn acosh(x double) double {
	return C.gsl_acosh(x)
}

fn C.gsl_asinh (x double) double
[inline]
pub fn asinh(x double) double {
	return C.gsl_asinh(x)
}

fn C.gsl_atanh (x double) double
[inline]
pub fn atanh(x double) double {
	return C.gsl_atanh(x)
}

fn C.gsl_isnan (x double) double
[inline]
pub fn isnan(x double) double {
	return C.gsl_isnan(x)
}

fn C.gsl_isinf (x double) double
[inline]
pub fn isinf(x double) double {
	return C.gsl_isinf(x)
}

fn C.gsl_finite (x double) double
[inline]
pub fn finite(x double) double {
	return C.gsl_finite(x)
}

fn C.gsl_nan() double
[inline]
pub fn nan(x double) double {
	return C.gsl_nan(x)
}

fn C.gsl_posinf() double
[inline]
pub fn pos_inf(x double) double {
	return C.gsl_posinf(x)
}

fn C.gsl_neginf() double
[inline]
pub fn neg_inf(x double) double {
	return C.gsl_neginf(x)
}

fn C.gsl_fdiv (x double, y double) double
[inline]
pub fn fdiv(x double, y double) double {
	return C.gsl_fdiv(x, y)
}

fn C.gsl_coerce_double (x double) double
[inline]
pub fn coerce_double(x double) double {
	return C.gsl_coerce_double(x)
}

fn C.gsl_coerce_float (x float) float
[inline]
pub fn coerce_float(x double) double {
	return C.gsl_coerce_float(x)
}

// long fn C.gsl_coerce_long_double (const long double x) double

fn C.gsl_ldexp(x double, e int) double
fn C.gsl_frexp(x double, e &int) double

fn C.gsl_fcmp (x1 double, x2 double, epsilon double) double
[inline]
pub fn compare_with_accuracy(x1 double, x2 double, epsilon double) double {
	return C.gsl_fcmp(x1, x2, epsilon)
}


