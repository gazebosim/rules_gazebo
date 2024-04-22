"""Generate a visibility export macro header"""

load(
    "@bazel_skylib//rules:expand_template.bzl",
    "expand_template",
)
load("@rules_cc//cc:defs.bzl", "cc_library")

def gz_export_header(name, lib_name, export_base, out):
    expand_template(
        name = name + "_template",
        out = out,
        substitutions = {
            "@export_base@": export_base,
            "@lib_name@": lib_name,
        },
        template = "@rules_gz//gz/templates:gz_export_header.tpl.hh",
    )
    cc_library(
        name = name,
        hdrs = [out],
        includes = ["include"],
    )
