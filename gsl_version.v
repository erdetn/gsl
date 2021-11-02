// Copyright(C) 2021 Erdet Nasufi. All rights reserved. MIT License.

module gsl 

pub struct Version {
	major int
	minor int
	version string
}

pub fn version() Version {
	return Version{
		major: C.GSL_MAJOR_VERSION
		minor: C.GSL_MINOR_VERSION
		version: string(C.GSL_VERSION)
	}
}
