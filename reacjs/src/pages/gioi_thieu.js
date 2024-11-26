import Header from "../components/header";
import Footer from "../components/footer";
import ListBanner from "./list_banner";
import News from "../components/news";
import Loading from "../components/loading";
import { useEffect, useState } from "react";
import axios from "axios";
import Product from "../components/product";
function GioiThieu() {
    const [listProduct, setListProduct] = useState([]);
    const [loading, setLoading] = useState(true); // Thêm state loading

    useEffect(() => {
        const fetchData = async () => {
            try {
                const responseProduct = await axios.get(
                    "http://127.0.0.1:8000/api/product"
                );
                const products = responseProduct.data.data;

                setListProduct(products);
                setLoading(false); // Kết thúc loading khi dữ liệu đã được tải

            } catch (error) {
                console.error(
                    "Error fetching products:",
                    error.response ? error.response.data : error.message
                );
            }
        };

        fetchData();

    }, []);

    return (
        <>
            <Header />
            <div className="banner_new">
                <div className="list_banner">
                    <ListBanner />
                </div>
                <div className="list_new">
                    <News />
                </div>
            </div>
            <div id="gioi_thieu">
                <h2>Về Chúng Tôi</h2>
                <p>
                    Website Nhóm 5 là một công ty chuyên kinh doanh điện thoại di động. Chúng tôi luôn cam kết mang đến cho khách hàng những sản phẩm chất lượng tốt nhất cùng dịch vụ hỗ trợ tận tình.
                </p>

                <h2>Thông Tin Liên Hệ</h2>
                <p>
                    <strong>Địa chỉ:</strong> Quận 1, Thành phố Hồ Chí Minh<br />
                    <strong>Lĩnh vực kinh doanh:</strong> Bán điện thoại di động
                </p>

                <h2>Chính Sách</h2>
                <ul>
                    <li>Chính sách bảo hành: Cam kết bảo hành sản phẩm trong vòng 12 tháng.</li>
                    <li>Chính sách đổi trả: Đổi trả trong vòng 7 ngày nếu sản phẩm bị lỗi kỹ thuật.</li>
                    <li>Hỗ trợ khách hàng: Đội ngũ chăm sóc khách hàng hoạt động 24/7.</li>
                    <li>Chính sách giao hàng: Giao hàng miễn phí trong nội thành Quận 1.</li>
                    <li>Thanh toán linh hoạt: Hỗ trợ thanh toán qua thẻ, tiền mặt hoặc ví điện tử.</li>
                </ul>
            </div>
            <div id="body">
                <p className="strong-product-introduce">Các sản phẩm nổi bật tại Nhóm 5</p>
                {loading ? (
                    <Loading />
                ) : (
                    <>
                        <div id="list-product">
                            {listProduct.map(item => (
                                <Product key={item.id} member={item} />
                            ))}
                        </div>

                    </>
                )}
            </div>
            <Footer />
        </>
    );
}
export default GioiThieu;