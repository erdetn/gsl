// Copyright(C) 2021 Erdet Nasufi. All rights reserved. MIT License.

module gsl 

// struct gsl_block_float_struct
// {
//   size_t size;
//   float *data;
// };

struct C.gsl_block_float{
	size C.size_t
	data &float
}

pub struct BlockFloat {
	ptr &C.gsl_block_float
}

fn C.gsl_block_float_alloc (n size_t) &C.gsl_block_float
fn C.gsl_block_float_calloc (n size_t) &C.gsl_block_float
fn C.gsl_block_float_free (C.gsl_block_float)

pub fn new_block_float(n size_t) BlockFloat {
	return BlockFloat{
		ptr: C.gsl_block_float_alloc(n)
	}
}

pub fn calloc_block_float(n size_t) {
	return BlockFloat{
		ptr: C.gsl_block_float_calloc(n)
	}
}

pub fn (this BlockFloat)free() {
	C.gsl_block_float_free(this.ptr)
}

pub fn (this BlockFloat)get(index size_t) ?float {
	if index > this.ptr.size {
		return error('Index out of the range.')
	}
	return f32(this.ptr.data[size_t])
}

pub fn (this BlockFloat)set(index size_t, value float)? {
	if index > this.size {
		return error('Index out of the range.')
	}
	this.ptr.data[index] = float(value)
}

fn C.gsl_block_float_fread (stream &C.FILE, b &C.gsl_block_float) int
fn C.gsl_block_float_fwrite (stream &C.FILE, b &C.gsl_block_float) int
fn C.gsl_block_float_fscanf (stream &C.FILE, b &C.gsl_block_float) int
fn C.gsl_block_float_fprintf (stream &C.FILE, b &C.gsl_block_float, format &char) int

fn C.gsl_block_float_raw_fread (stream &C.FILE, b &float, n size_t, stride size_t) int
fn C.gsl_block_float_raw_fwrite (stream &C.FILE, b &float, n size_t, stride size_t) int
fn C.gsl_block_float_raw_fscanf (stream &C.FILE, b &float, n size_t, stride size_t) int
fn C.gsl_block_float_raw_fprintf (stream &C.FILE, b &float, n size_t, stride size_t, format &char) int

fn C.gsl_block_float_size (b &C.gsl_block_float) size_t
pub fn (this BlockFloat)size() size_t {
	return C.gsl_block_float_size(this.ptr)
}

fn C.gsl_block_float_data (b &C.gsl_block_float) &float
