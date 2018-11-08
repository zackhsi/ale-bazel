call ale#linter#Define('scala', {
\   'name': 'bazel-scala',
\   'executable': 'bazel',
\   'command': 'bazel build ...',
\   'callback': 'ale_handlers#scala#bazel#Handle',
\})
