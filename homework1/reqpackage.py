#install graphviz for this code

import os
import pkg_resources
import sys


def get_dependencies(package_name, visited):
    dependencies = []
    try:
        distribution = pkg_resources.get_distribution(package_name)
        dependencies = distribution.requires()
    except pkg_resources.DistributionNotFound:
        pass
    dependencies_str = ''

    for dependency in dependencies:
        dep_name = dependency.project_name

        if dep_name not in visited:
            dependencies_str += f'    "{package_name}" -> "{dep_name}";\n'
            visited.add(dep_name)
            dependencies_str += get_dependencies(dep_name, visited)

    return dependencies_str


def generate_graphviz(package_name):
    graphviz_str = 'digraph Dependencies {\n'
    visited = set()

    graphviz_str += f'    "{package_name}";\n'
    visited.add(package_name)
    graphviz_str += get_dependencies(package_name, visited)

    graphviz_str += '}'

    return graphviz_str


if __name__ == "__main__":
    package_name = sys.argv[1]
    out_file = sys.argv[2]
    graphviz_str = generate_graphviz(package_name)
    with open(out_file+'.dot', 'wt') as f:
        f.write(graphviz_str)
    os.system('dot -Tpng ' + out_file + '.dot -o ' + out_file + '.png')
    os.system('rm ' + out_file + '.dot')
