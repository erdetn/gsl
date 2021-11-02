// Copyright(C) 2021 Erdet Nasufi. All rights reserved. MIT License.

module gsl 

struct C.gsl_vector_float{}
pub struct VectorFloat {
	ptr &C.gsl_vector_float
}

struct C.gsl_vector_float_view{}
pub struct VectorFloatView {
	ptr &C.gsl_vector_float_view
}

struct C.gsl_vector_float_const_view{}
pub struct VectorFloatConstView {
	ptr &C.gsl_vector_float_const_view
}


/* Allocation */

fn C.gsl_vector_float_alloc (n size) &C.gsl_vector_float
pub fn new_vector_float(n size) VectorFloat {
	return VectorFloat{
		ptr: C.gsl_vector_float_alloc(n)
	}
}

fn C.gsl_vector_float_calloc (n size) &C.gsl_vector_float
pub fn calloc_vector_float(n size) VectorFloat {
	return VectorFloat {
		ptr: C.gsl_vector_float_calloc(n)
	}
}

fn C.gsl_vector_float_alloc_from_block (&C.gsl_block_float, size, size, size)  &C.gsl_vector_float

fn C.gsl_vector_float_alloc_from_vector (&C.gsl_vector_float, size, size, size) &C.gsl_vector_float

fn C.gsl_vector_float_free (&C.gsl_vector_float)
pub fn (this VectorFloat)free() {
	C.gsl_vector_float_free(this.ptr)
}

// Views
// TODO //
fn C.gsl_vector_float_view_array(v &C.float, n C.size_t) C._gsl_vector_float_view 

fn C.gsl_vector_float_view_array_with_stride (&C.float, size, size) C._gsl_vector_float_view
 
fn C.gsl_vector_float_const_view_array (const float *v, size_t n) C._gsl_vector_float_const_view

fn C.gsl_vector_float_const_view_array_with_stride (&C.float, size, size) C._gsl_vector_float_const_view
 
fn C.gsl_vector_float_subvector (&C.gsl_vector_float, size, size) C._gsl_vector_float_view

fn C.gsl_vector_float_subvector_with_stride (&C.gsl_vector_float, size, size, size)C._gsl_vector_float_view
 
fn C.gsl_vector_float_const_subvector (&C.gsl_vector_float, size, size) C._gsl_vector_float_const_view

fn C.gsl_vector_float_const_subvector_with_stride (&C.gsl_vector_float, size, size, size) C._gsl_vector_float_const_view
// ---- //

// Operations

fn C.gsl_vector_float_set_zero(&C.gsl_vector_float)
pub fn (this VectorFloat)zero() {
	C.gsl_vector_float_set_zero(this.ptr)
}

fn C.gsl_vector_float_set_all (&C.gsl_vector_float, C.float)
pub fn (this VectorFloat)set_all(value f32) {
	C.gsl_vector_float_set_all(this.ptr, C.float(value))
}

fn C.gsl_vector_float_set_basis(&C.gsl_vector_float, size) int
pub fn (this VectorFloat)set_basis(i size) int {
	return C.gsl_vector_float_set_basis(this.ptr, i)
}

// TODO //
fn C.gsl_vector_float_fread (stream &C.FILE, v &C.gsl_vector_float) int
fn C.gsl_vector_float_fwrite (stream &C.FILE, v &C.gsl_vector_float) int
fn C.gsl_vector_float_fscanf (stream &C.FILE, v &C.gsl_vector_float) int
fn C.gsl_vector_float_fprintf (stream &C.FILE, v &C.gsl_vector_float, format &C.char) int
// ---- //

fn C.gsl_vector_float_memcpy(&C.gsl_vector_float, &C.gsl_vector_float) int
pub fn (this VectorFloat)copy_from(source VectorFloat) int {
	return C.gsl_vector_float_memcpy(this.ptr, source.ptr)
}

fn C.gsl_vector_float_reverse(&C.gsl_vector_float) int
pub fn (this VectorFloat)reverse() int {
	return C.gsl_vector_float_reverse(this.ptr)
}

fn C.gsl_vector_float_swap(&C.gsl_vector_float, &C.gsl_vector_float) int
pub fn (this VectorFloat)swap(mut vec VectorFloat) int {
	return C.gsl_vector_float_swap(this.ptr, vec.ptr)
}

fn C.gsl_vector_float_swap_elements (&C.gsl_vector_float, i C.size_t, j C.size_t) int
pub fn (this VectorFloat)swap_elements(i size, j size) int {
	return C.gsl_vector_float_swap_elements(this.ptr, i, j)
}

fn C.gsl_vector_float_max(&C.gsl_vector_float) C.float
pub fn (this VectorFloat)max() f32 {
	return f32(this.gsl_vector_float_max(this.ptr))
}

fn C.gsl_vector_float_min(&C.gsl_vector_float) C.float
pub fn (this VectorFloat)min() f32 {
	return f32(this.gsl_vector_float_min(this.ptr))
}

fn C.gsl_vector_float_minmax(&C.gsl_vector_float, min_out &C.float, max_out &C.float)

fn C.gsl_vector_float_max_index(&C.gsl_vector_float) C.size_t
pub fn (this VectorFloat)max_index() u32 {
	return u32(this.gsl_vector_float_max_index(this.ptr))
}

fn C.gsl_vector_float_min_index(&C.gsl_vector_float) C.size_t
pub fn (this VectorFloat)min_index() u32 {
	return u32(this.gsl_vector_float_min_index(this.ptr))
}

// TODO //
fn C.gsl_vector_float_minmax_index(&C.gsl_vector_float, imin &C.size_t, imax &C.size_t)
// ---- //

fn C.gsl_vector_float_add(&C.gsl_vector_float, &C.gsl_vector_float) int
fn C.gsl_vector_float_sub(&C.gsl_vector_float, &C.gsl_vector_float) int
fn C.gsl_vector_float_mul(&C.gsl_vector_float, &C.gsl_vector_float) int
fn C.gsl_vector_float_div(&C.gsl_vector_float, &C.gsl_vector_float) int

pub fn (this VectorFloat)add(ref VectorFloat) int {
	return C.gsl_vector_float_add(this.ptr, ref.ptr)
}
pub fn (this VectorFloat)+(ref VectorFloat) int {
	return C.gsl_vector_float_add(this.ptr, ref.ptr)
}

pub fn (this VectorFloat)sub(ref VectorFloat) int {
	return C.gsl_vector_float_sub(this.ptr, ref.ptr)
}
pub fn (this VectorFloat)-(ref VectorFloat) int {
	return C.gsl_vector_float_sub(this.ptr, ref.ptr)
}

pub fn (this VectorFloat)mul(ref VectorFloat) int {
	return C.gsl_vector_float_mul(this.ptr, ref.ptr)
}
pub fn (this VectorFloat)*(ref VectorFloat) int {
	return C.gsl_vector_float_mul(this.ptr, ref.ptr)
}

pub fn (this VectorFloat)div(ref VectorFloat) int {
	return C.gsl_vector_float_div(this.ptr, ref.ptr)
}
pub fn (this VectorFloat)/(ref VectorFloat) int {
	return C.gsl_vector_float_div(this.ptr, ref.ptr)
}

fn C.gsl_vector_float_scale(&C.gsl_vector_float, double) int
pub fn (this VectorFloat)scale(x double) int {
	return C.gsl_vector_float_scale(this.ptr, x)
}

fn C.gsl_vector_float_add_constant(&C.gsl_vector_float, double) int 
pub fn (this VectorFloat)add_constant(x double) int {
	return C.gsl_vector_float_add_constant(this.ptr, x)
}

fn C.gsl_vector_float_equal)&C.gsl_vector_float, &C.gsl_vector_float) int
pub fn (this VectorFloat)equal_with(ref VectorFloat) bool {
	rc := C.gsl_vector_float_equal(this.ptr, ref.ptr)
	return rc == 1
}

pub fn (this VectorFloat)==(ref VectorFloat) bool {
	rc := C.gsl_vector_float_equal(this.ptr, ref.ptr)
	return rc == 1
}

fn C.gsl_vector_float_isnull(&C.gsl_vector_float) int
pub fn (this VectorFloat)is_null() bool {
	rc := C.gsl_vector_float_isnull(this.ptr)
	return rc == 1
}

fn C.gsl_vector_float_ispos(&C.gsl_vector_float) int
pub fn (this VectorFloat)is_positive() bool {
	rc := C.gsl_vector_float_ispos(this.ptr)
	return rc == 1
}

fn C.gsl_vector_float_isneg(&C.gsl_vector_float) int
pub fn (this VectorFloat)is_negtive() bool {
	rc := C.gsl_vector_float_isneg(this.ptr)
	return rc == 1
}

fn C.gsl_vector_float_isnonneg(&C.gsl_vector_float) int
pub fn (this VectorFloat)is_non_negative() bool {
	rc := C.gsl_vector_float_isnonneg(this.ptr)
	return rc == 1
}

fn C.gsl_vector_float_get(&C.gsl_vector_float, index size) float
pub fn (this VectorFloat)get(index size) float {
	return float(C.gsl_vector_float_get(this.ptr, index))
}

fn C.gsl_vector_float_set(&C.gsl_vector_float, size, float)
pub fn (this VectorFloat)set(index size, value float) {
	C.gsl_vector_float_set(this.ptr, index, value)
}

fn C.gsl_vector_float_ptr(&C.gsl_vector_float, size) C.float
fn C.gsl_vector_float_const_ptr(&C.gsl_vector_float, size) &C.float
