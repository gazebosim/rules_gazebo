/*
 * Copyright (C) 2017 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/

/*
 * ==========================================================================
 * This file was automatically generated by Bazel; do not modify it directly.
 * To modify this file, make changes to ign-bazel/ign_export_header.bzl
 * ==========================================================================
*/

#ifndef GZ_SMOKE_EXPORT_HH_
#define GZ_SMOKE_EXPORT_HH_

#ifndef DETAIL_GZ_SMOKE_VISIBLE
#define DETAIL_GZ_SMOKE_VISIBLE \
    __attribute__ ((visibility("default")))
#endif

#ifndef DETAIL_GZ_SMOKE_HIDDEN
#define DETAIL_GZ_SMOKE_HIDDEN \
    __attribute__ ((visibility("hidden")))
#endif

#ifndef GZ_SMOKE_VISIBLE
/// For gz-smoke developers: Apply this macro to gz-smoke
/// functions and classes which consumers of this library will need to be able
/// to call from their own programs or libraries.
#define GZ_SMOKE_VISIBLE \
    DETAIL_GZ_SMOKE_VISIBLE
#endif


#ifndef GZ_SMOKE_HIDDEN
/// For gz-smoke developers: Apply this macro to gz-smoke
/// functions and classes which must not be used by consumers of this library.
/// By default, this property is applied to all classes and functions which are
/// not tagged with GZ_SMOKE_VISIBLE, so this does not
/// generally need to be used.
#define GZ_SMOKE_HIDDEN \
    DETAIL_GZ_SMOKE_HIDDEN
#endif


#ifndef GZ_DEPRECATED
/// For gz-smoke developers: Use this macro to indicate that a
/// function or class has been deprecated and should no longer be used. A
/// version should be specified to provide context to the user about when the
/// function became deprecated.
#define GZ_DEPRECATED(version) __attribute__ ((__deprecated__))
#endif

#endif
