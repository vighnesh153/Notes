import asyncio


async def func1():
    print('hello')
    await asyncio.sleep(1)
    print('world')


async def func2():
    print('vighnesh')
    await asyncio.sleep(1)
    print('153')


async def main():
    task1 = asyncio.create_task(func1())
    task2 = asyncio.create_task(func2())

    await task1
    await task2


asyncio.run(main())

# Output:
# hello
# vighnesh
# world
# 153
