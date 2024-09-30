"""Configure a header file from an input template"""

load("@rules_cc//cc:defs.bzl", "cc_library")

def _gz_configure_file_impl(ctx):
    arguments = [
        "--input",
        ctx.file.src.path,
        "--output",
        ctx.outputs.out.path,
        "--package_xml",
        ctx.file.package_xml.path,
    ]

    for item in ctx.attr.defines:
        arguments.append("-D" + item)
    for item in ctx.attr.undefines:
        arguments.append("-U" + item)

    # Action to call the script.
    ctx.actions.run(
        inputs = [ctx.file.src, ctx.info_file, ctx.file.package_xml],
        outputs = [ctx.outputs.out],
        arguments = arguments,
        env = ctx.attr.env,
        executable = ctx.executable.gz_configure_file_py,
    )
    return []

_gz_configure_file_gen = rule(
    attrs = {
        "defines": attr.string_list(),
        "env": attr.string_dict(
            mandatory = True,
            allow_empty = True,
        ),
        "gz_configure_file_py": attr.label(
            cfg = "exec",
            executable = True,
            default = Label("//gz/private:gz_configure_file"),
        ),
        "out": attr.output(mandatory = True),
        "package_xml": attr.label(allow_single_file = True, mandatory = True),
        "src": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "undefines": attr.string_list(),
    },
    implementation = _gz_configure_file_impl,
)

def gz_configure_file(
        name,
        src = None,
        out = None,
        defines = None,
        undefines = None,
        package_xml = None,
        **kwargs):
    """
    Expand templates in a file using project variables

    Args:
      name: Name of the file to generate
      src: Input template
      out: Output file location
      defines: Variables to define
      undefines: Variables to unset
      package_xml: Package.xml file to read name and version from
      **kwargs: Additional keyword arguments
    """
    if not out:
        out = src
        idx = out.find(".in")
        if (idx > 0):
            out = out[0:idx]

    _gz_configure_file_gen(
        name = name + "_config",
        src = src,
        out = out,
        defines = defines,
        undefines = undefines,
        package_xml = package_xml,
        env = {},
        **kwargs
    )

    cc_library(
        name = name,
        hdrs = [out],
        includes = ["include"],
    )
