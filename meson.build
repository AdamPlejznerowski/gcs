project(
    'gcpp',
    'cpp',
    version: '0.1.0',
    default_options: [
        'cpp_std=c++23',
        'warning_level=3',
        'werror=false',
    ]
)

add_project_arguments(
    '-fmodules-ts',
    '-Wno-pedantic',
    language: 'cpp'
)
subproject('cppgir')
subdir('src')