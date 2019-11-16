# The new importlib.metadata module provides (provisional) support for reading metadata from
# third-party packages. For example, it can extract an installed package’s version number, list of
# entry points, and more:



# Note following example requires that the popular "requests"
# package has been installed.
from importlib.metadata import version, requires, files

print(version('requests'))
# '2.22.0'

print(list(requires('requests')))
# ['chardet (<3.1.0,>=3.0.2)']

print(list(files('requests'))[:5])
# [PackagePath('requests-2.22.0.dist-info/INSTALLER'),
#  PackagePath('requests-2.22.0.dist-info/LICENSE'),
#  PackagePath('requests-2.22.0.dist-info/METADATA'),
#  PackagePath('requests-2.22.0.dist-info/RECORD'),
#  PackagePath('requests-2.22.0.dist-info/WHEEL')]
