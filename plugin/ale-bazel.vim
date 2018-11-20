call ale#linter#Define('scala', {
\   'name': 'bazel-scala',
\   'executable': 'bazel-package-builder',
\   'command': 'bazel-package-builder %s',
\   'callback': 'ale_handlers#scala#bazel#Handle',
\})
