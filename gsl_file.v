// Copyright(C) 2021 Erdet Nasufi. All rights reserved. MIT License.

module gsl 

#include <stdio.h>

pub struct File {
mut:
	ptr &C.FILE
}

pub enum FileSeek {
	set = C.SEEK_SET
	current_position = C.SEEK_CUR
	end = C.SEEK_END
}

pub type char = C.char

pub fn new_file() {
	return File {
		ptr: voidptr(0)
	}
}

pub const (
	file_read_mode = 'r'
	file_write_mode = 'w'
	file_append_mode = 'a'
	file_read_write_mode = 'r+'
	file_read_overwrite_mode = 'w+'
	file_read_append = 'a+'
)

pub const end_of_file = C.EOF

fn C.fopen(&char, &char) &C.FILE

pub fn (mut this File)open(filename string, mode string) {
	unsafe {
		this.ptr = C.fopen(
			&char(filename.str),
			&char(mode.str))
	}
}

fn C.fclose(&C.FILE)
pub fn (this File)close() {
	C.fclose(this.ptr)
}

fn C.fputc(C.char, &C.FILE) int
pub fn (this File)write_char(c char) {
	C.fputc(c, this.ptr)
}

fn C.fputs(&char, &C.FILE) int
pub fn (this File)write(text string) {
	unsafe {
		C.fputs(&char(text.str), this.ptr)
	}
}

fn C.fflush(&C.FILE) int
pub fn (this File)flush() {
	C.fflush(this.ptr)
}

fn C.fgetc(&C.FILE) int
pub fn (this File)read_char() byte {
	return byte(C.fgetc(this.ptr))
}

fn C.fgets(&char, int, &C.FILE) &char
pub fn (this File)read_buffer(size u32) string {
	mut buffer := []byte{cap: size+1, len: size+1}
	unsafe {
		C.fgets(&char(buffer[0]), size, this.ptr)
	}
	return buffer.bytestr()
}

fn C.fpurge(&C.FILE) int
pub fn (this File)purge() {
	C.fpurge(this.ptr)
}

fn C.fseek(&C.FILE, u64, int) int
pub fn (this File)seek(offset u64, seek_mode FileSeek) bool {
	rc := C.fseek(this.ptr, offset, int(seek_mode))
	return rc == 0
}

fn C.fileno(&C.FILE) int
pub fn (this File)fd() int {
	return C.fileno(this.ptr)
}

fn C.fsync(int) int
pub fn (this File)sync() bool {
	fd := this.fd()
	rc := C.fsync(fd)
	return rc == 0
}
