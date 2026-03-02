
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS users;

-- Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    avatar_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Restaurants Table
CREATE TABLE restaurants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    category VARCHAR(50),
    rating DECIMAL(2,1) DEFAULT 0.0,
    delivery_time VARCHAR(50),
    delivery_fee DECIMAL(10,2) DEFAULT 0.00,
    address TEXT,
    is_open BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category),
    INDEX idx_rating (rating)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Categories Table
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    INDEX idx_restaurant (restaurant_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Products Table
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    is_available BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    INDEX idx_restaurant (restaurant_id),
    INDEX idx_category (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Carts Table
CREATE TABLE carts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE SET NULL,
    INDEX idx_user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cart Items Table
CREATE TABLE cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_cart (cart_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Orders Table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(10,2) DEFAULT 0.00,
    status ENUM('pending', 'confirmed', 'preparing', 'on_delivery', 'delivered', 'cancelled') DEFAULT 'pending',
    payment_method VARCHAR(50),
    delivery_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    INDEX idx_user (user_id),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Order Items Table
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    INDEX idx_order (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Seed Data

-- Insert Sample Users
INSERT INTO users (name, email, password, phone, address) VALUES
('João Silva', 'joao@email.com', '$2b$10$XqZ5J5J5J5J5J5J5J5J5JuExample', '(11) 98765-4321', 'Rua das Flores, 123, São Paulo'),
('Maria Santos', 'maria@email.com', '$2b$10$XqZ5J5J5J5J5J5J5J5J5JuExample', '(11) 91234-5678', 'Av. Paulista, 1000, São Paulo');

-- Insert Sample Restaurants
INSERT INTO restaurants (name, description, image_url, category, rating, delivery_time, delivery_fee, address, is_open) VALUES
('Burger King', 'Os melhores hambúrgueres da cidade', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400', 'Hambúrguer', 4.5, '30-40 min', 5.00, 'Av. Principal, 500', true),
('Pizza Hut', 'Pizzas artesanais deliciosas', 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400', 'Pizza', 4.7, '40-50 min', 7.00, 'Rua da Pizza, 200', true),
('Sushi Express', 'Culinária japonesa autêntica', 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400', 'Japonês', 4.8, '45-55 min', 8.00, 'Rua Japão, 150', true),
('Taco Bell', 'Comida mexicana saborosa', 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400', 'Mexicano', 4.3, '25-35 min', 4.50, 'Av. México, 300', true),
('Pasta House', 'Massas italianas caseiras', 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400', 'Italiano', 4.6, '35-45 min', 6.00, 'Rua Itália, 400', true);

-- Insert Categories for Burger King
INSERT INTO categories (restaurant_id, name, display_order) VALUES
(1, 'Hambúrgueres', 1),
(1, 'Acompanhamentos', 2),
(1, 'Bebidas', 3),
(1, 'Sobremesas', 4);

-- Insert Products for Burger King
INSERT INTO products (restaurant_id, category_id, name, description, price, image_url, is_available) VALUES
(1, 1, 'Whopper', 'O clássico Whopper com queijo, alface e tomate', 25.90, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300', true),
(1, 1, 'Big King', 'Dois hambúrgueres, queijo e molho especial', 28.90, 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=300', true),
(1, 2, 'Batata Frita Grande', 'Porção grande de batatas fritas crocantes', 12.90, 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=300', true),
(1, 2, 'Onion Rings', 'Anéis de cebola empanados', 10.90, 'https://images.unsplash.com/photo-1639024471283-03518883512d?w=300', true),
(1, 3, 'Coca-Cola 500ml', 'Refrigerante gelado', 7.00, 'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=300', true),
(1, 4, 'Sundae de Chocolate', 'Sorvete com calda de chocolate', 8.90, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=300', true);

-- Insert Categories for Pizza Hut
INSERT INTO categories (restaurant_id, name, display_order) VALUES
(2, 'Pizzas Tradicionais', 1),
(2, 'Pizzas Especiais', 2),
(2, 'Bebidas', 3);

-- Insert Products for Pizza Hut
INSERT INTO products (restaurant_id, category_id, name, description, price, image_url, is_available) VALUES
(2, 5, 'Pizza Margherita', 'Molho de tomate, mussarela e manjericão', 39.90, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=300', true),
(2, 5, 'Pizza Calabresa', 'Calabresa, cebola e azeitonas', 42.90, 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=300', true),
(2, 6, 'Pizza Quatro Queijos', 'Mussarela, parmesão, gorgonzola e provolone', 49.90, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=300', true),
(2, 7, 'Refrigerante 2L', 'Refrigerante 2 litros', 10.00, 'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=300', true);

-- Insert Categories for Sushi Express
INSERT INTO categories (restaurant_id, name, display_order) VALUES
(3, 'Sushi', 1),
(3, 'Sashimi', 2),
(3, 'Hot Rolls', 3);

-- Insert Products for Sushi Express
INSERT INTO products (restaurant_id, category_id, name, description, price, image_url, is_available) VALUES
(3, 8, 'Combo Sushi 20 peças', 'Variedade de sushis frescos', 55.00, 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=300', true),
(3, 9, 'Sashimi de Salmão', '10 fatias de salmão fresco', 45.00, 'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?w=300', true),
(3, 10, 'Hot Philadelphia', 'Hot roll com salmão e cream cheese', 38.00, 'https://images.unsplash.com/photo-1582450871972-ab5ca641643d?w=300', true);