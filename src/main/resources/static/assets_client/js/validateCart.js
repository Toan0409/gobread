// Dữ liệu giả lập giỏ hàng
const fakeCartItems = [
    {
        id: 1,
        name: "Bánh mì thịt",
        image: "/assets_client/img/menu/bread-1.jpg",
        price: 15000,
        quantity: 2
    },
    {
        id: 2,
        name: "Bánh mì pate",
        image: "/assets_client/img/menu/bread-2.jpg",
        price: 12000,
        quantity: 1
    },
    {
        id: 3,
        name: "Bánh mì trứng",
        image: "/assets_client/img/menu/bread-3.jpg",
        price: 10000,
        quantity: 3
    }
];

// Hàm format tiền VND
function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(amount);
}

// Hàm cập nhật số lượng
function updateQuantity(id, change) {
    const item = fakeCartItems.find(item => item.id === id);
    if (item) {
        item.quantity = Math.max(1, item.quantity + change);
        renderCart();
    }
}

// Hàm xóa sản phẩm
function removeItem(id) {
    const index = fakeCartItems.findIndex(item => item.id === id);
    if (index !== -1) {
        fakeCartItems.splice(index, 1);
        renderCart();
    }
}

// Hàm render giỏ hàng
function renderCart() {
    const cartBody = document.getElementById('cart-body');
    cartBody.innerHTML = '';

    let totalPrice = 0;

    fakeCartItems.forEach((item, index) => {
        const itemTotal = item.price * item.quantity;
        totalPrice += itemTotal;

        cartBody.innerHTML += `
            <tr>
                <td>${index + 1}</td>
                <td>${item.name}</td>
                <td><img src="${item.image}" alt="${item.name}" style="width: 50px; height: 50px; object-fit: cover;"></td>
                <td>${formatCurrency(item.price)}</td>
                <td>
                    <div class="input-group w-75 mx-auto">
                        <button class="btn btn-outline-secondary" onclick="updateQuantity(${item.id}, -1)">-</button>
                        <input type="text" class="form-control text-center" value="${item.quantity}" readonly>
                        <button class="btn btn-outline-secondary" onclick="updateQuantity(${item.id}, 1)">+</button>
                    </div>
                </td>
                <td>${formatCurrency(itemTotal)}</td>
                <td>
                    <button class="btn btn-danger btn-sm" onclick="removeItem(${item.id})">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
        `;
    });

    document.getElementById('total-price').textContent = formatCurrency(totalPrice);
}

// Hàm đặt hàng
function placeOrder() {
    if (fakeCartItems.length === 0) {
        alert('Giỏ hàng trống!');
        return;
    }

    if (confirm('Xác nhận đặt hàng?')) {
        alert('Đặt hàng thành công!');
        fakeCartItems.length = 0; // Xóa giỏ hàng
        renderCart();
    }
}

// Khởi tạo giỏ hàng khi trang được load
document.addEventListener('DOMContentLoaded', renderCart);