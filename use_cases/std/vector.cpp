#include <stdio.h>
#include <stdint.h>
#include <vector>

/// STL allocator that takes care that memory is aligned to N bytes
template <typename T, size_t N>
class STLAlignedAllocator
{
private:
	size_t state = 0;
public:
	using value_type = T;

	/// Pointer to type
	using pointer = T *;
	using const_pointer = const T *;

	/// Reference to type.
	/// Can be removed in C++20.
	using reference = T &;
	using const_reference = const T &;

	using size_type = size_t;
	using difference_type = ptrdiff_t;

	/// Constructor
	inline					STLAlignedAllocator() = default;

	/// Constructor from other allocator
	template <typename T2>
	inline explicit			STLAlignedAllocator(const STLAlignedAllocator<T2, N> &) { }

	/// Allocate memory
	inline pointer			allocate(size_type inN)
	{
		return (pointer)malloc(sizeof(T) * inN);
	}

	/// Free memory
	inline void				deallocate(pointer inPointer, size_type)
	{
		free((void*)inPointer);
	}

	/// Allocators are stateless so assumed to be equal
	inline bool				operator == (const STLAlignedAllocator<T, N> &) const
	{
		return true;
	}

	inline bool				operator != (const STLAlignedAllocator<T, N> &) const
	{
		return false;
	}

	/// Converting to allocator for other type
	template <typename T2>
	struct rebind
	{
		using other = STLAlignedAllocator<T2, N>;
	};
};

struct vector_layout {
    void* head;
    void* tail;
    void* end;
};

template <class _Alloc>
struct vector_with_custom_alloc_layout {
    void* head;
    void* tail;
    void* end;
    _Alloc alloc;
};

int main() {
    printf("std::vector<char>\n");
    printf("size: %d -> %d\n", sizeof(std::vector<char>), sizeof(vector_layout));

    auto vec0 = std::vector<char>();
    vec0.push_back('a');
    vec0.push_back('b');
    vec0.push_back('c');
    auto layout0 = (vector_layout*)(&vec0);

    printf("ptr: %p -> %p\n", vec0.data(), layout0->head);
    printf("size: %d -> %d\n", vec0.size(), (size_t)layout0->tail - (size_t)layout0->head);
    printf("capacity: %d -> %d\n", vec0.capacity(),  (size_t)layout0->end - (size_t)layout0->head);
    
    printf("=============================================\n");
    printf("std::vector<char, STLAlignedAllocator<char, 64>>\n");
    printf("size: %d -> %d\n", sizeof(std::vector<char, STLAlignedAllocator<char, 64>>), sizeof(vector_with_custom_alloc_layout<STLAlignedAllocator<char, 64>>));

	auto vec1 = std::vector<char, STLAlignedAllocator<char, 64>>();
    vec1.push_back('a');
    vec1.push_back('b');
    vec1.push_back('c');
    auto layout1 = (vector_with_custom_alloc_layout<STLAlignedAllocator<char, 64>>*)(&vec1);

    printf("ptr: %p -> %p\n", vec1.data(), layout1->head);
    printf("size: %d -> %d\n", vec1.size(), (size_t)layout1->tail - (size_t)layout1->head);
    printf("capacity: %d -> %d\n", vec1.capacity(),  (size_t)layout1->end - (size_t)layout1->head);

    return 0;
}