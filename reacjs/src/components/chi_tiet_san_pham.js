import Header from "./header";
import Footer from "./footer";
import { NavLink, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { debounce } from 'lodash';
import numeral from 'numeral';
import 'chart.js/auto';
import CommentSection from "./comment_section";
import Slider from 'react-slick';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import { faStar, faGift, faShippingFast } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Modal, Button } from 'react-bootstrap';


import axios from "axios";
function CTSanPham(props) {

    
    return (

        <>

            <Header />
            <p className="ct-name-sp">Điện thoại</p>
            <div className="chi-tiet">

                <div className="hinhanhsp">

                    <div className="main-img">
                        
                    </div>

                    <div id="item-name-color">
                        {colors.map((colorId, index) => (

                            <>
                                <div className="name-color-img">
                                    <img
                                        key={index}
                                        src={`http://127.0.0.1:8000/${colorGroups[colorId][0].img_url}`}
                                        alt={`Hình màu ${index + 1}`}
                                        className={slide}
                                        onClick={() => { }}
                                    />
                                    <span >{props.data.product_detail.find(item => item.color.id == colorId)?.color.name}</span>
                                </div></>
                        ))}
                    </div>
                </div>


                <div className="info-product">
                    {getUniqueDungLuongs(props.data.product_detail).map((item) => (
                        <span
                            key={item.capacity.id}
                            className={item}
                            onClick={() => { }}                        >
                            {item.capacity.name || ''}
                        </span>
                    ))}
                    <br /><br />

                    {props.data.product_detail
                        .filter(item => item.capacity.name === selectedCapacity)
                        .map((item) => (
                            <span
                                key={item.id}
                                className={item}
                                onClick={() => { }}                            >
                                {item.color.name || ''}
                            </span>
                        ))}
                    <br /><br />


                    <div className="discount-product">

                        {currentDiscountValid && currentPercent > 0 ? (
                            <>
                                <div className="name-discount">
                                    <FontAwesomeIcon style={{ color: 'red' }} icon={faGift} /> Khuyến mãi
                                    <p id="remaining">Kết thúc:</p>
                                </div>
                                <strong className='free-city'><FontAwesomeIcon icon={faShippingFast} className="icon" />
                                    <span className="free-text">FREE</span>: TP.Hồ Chí Minh</strong>
                                <div className='price-percent'>
                                    <span className="price-have-discount">đ</span> 
                                </div>
                                <div className="price-detail">₫</div>

                            </>
                        ) : (
                            <>
                                <strong className='free-city'><FontAwesomeIcon icon={faShippingFast} className="icon" />
                                    <span className="free-text">FREE</span>: TP.Hồ Chí Minh</strong>
                                <div className="price-detail">₫</div></>
                        )}



                        <div className="quantity">
                            Số lượng:

                            <button className="tru-so-luong" onClick={HandelTru}>-</button>
                            <input type="number" className="input-so-luong" value={Count} readOnly />
                            <button className="cong-so-luong" onClick={HandelCong}>+</button>

                        </div>
                        <br />

                        {token ? (
                            <>
                                <button onClick={chonMuaHandler} className="btn btn-danger buy-now">Mua ngay</button>
                            </>
                        ) : (
                            <>
                                <button onClick={chonMuaHandler} className="btn btn-danger buy-now">Mua ngay</button>
                            </>
                        )
                        }

                        <button onClick={themVaoGioHandler} className="btn btn-primary add-cart">Thêm vào giỏ hàng</button>
                    </div>
                </div>
            </div>
            <div>
                <div className="policy">
                    <ul className="policy__list">
                        <li>
                            <div className="iconl">
                                <i className="icondetail-doimoi"></i>
                            </div>
                            <p>
                                Hư gì đổi nấy <b>12 tháng</b>  tại 3089 siêu thị toàn quốc (miễn phí tháng đầu) <a href="#"></a>
                                <a href="#" title="Chính sách đổi trả">
                                    Xem chi tiết
                                </a>
                            </p>
                        </li>
                        <li data-field="IsSameBHAndDT">
                            <div className="iconl">
                                <i className="icondetail-baohanh"></i>
                            </div>
                            <p>
                                Bảo hành <b>chính hãng điện thoại 1 năm</b> tại các trung tâm bảo hành hãng
                                <a href="#" target="_blank" title="Chính sách bảo hành">
                                    Xem địa chỉ bảo hành
                                </a>

                            </p>
                        </li>

                    </ul>
                </div>

                <div className="parameter">
                    <div className="danh-gia">
                        <div>thong ke</div>
                    </div>
                    <div className="binh-luan col-md-8">
                       dữ liệu binh luận ở đây
                    </div>

                    <ul className="parameter__list">
                        <h5>Thông tin sản phẩm:</h5>
                        <li className="productdetail_list">
                            <p className="lileft">Màn hình:</p>
                            <div className="liright">
                                <span className="">chi tiết màn hình</span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Hệ điều hành:</p>
                            <div className="liright">
                                <span className="">chi tiết OS</span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Camera:</p>
                            <div className="liright">
                                <span className="">camera</span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">RAM:</p>
                            <div className="liright">
                                <span className="">Ram GB</span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Dung lượng:</p>
                            <div className="liright">
                                <span className=""></span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Pin:</p>
                            <div className="liright">
                                <span className="comma">battery mAh</span>

                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Trọng lượng:</p>
                            <div className="liright">
                                <span className="">trọng lượng g</span>
                            </div>
                        </li>
                        <li className="productdetail_list">
                            <p className="lileft">Hãng</p>
                            <div className="liright">
                                <span className="">Bran</span>
                            </div>
                        </li>
                    </ul>



                    <button className="btn btn-outline-primary see-product-detail" onClick={() => { }}>
                        <span> Xem chi tiết cấu hình</span>
                    </button>




                </div>

            </div>
            <Modal show={show} onHide={handleClose} id="modal-confi-product" style={{ minWidth: '80%' }}>
                <Modal.Header closeButton>
                    <Modal.Title>Thông số kỹ thuật</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className="parameter-all">
                        <div className="parameter-item">
                            <p className="parameter-ttl">Màn hình</p>
                            <ul className="ulist">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Công nghệ màn hình:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p >Độ phân giải:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Màn hình rộng:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Độ sáng tối đa:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Camera sau</p>
                            <ul className="ulist ">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Độ phân giải:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Quay phim:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Đèn Flash:</p>
                                    </div>
                                    <div className="ctRight">
                                        {props.data.product_description.rear_camera.flash == 1 ? (
                                            <>
                                                <span>Có</span>
                                            </>
                                        ) : (
                                            <>
                                                <span>Không</span>
                                            </>
                                        )
                                        }

                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Tính năng:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>

                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Camera trước</p>
                            <ul className="ulist ">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Độ phân giải:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Tính năng:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Hệ điều hành &amp; CPU</p>
                            <ul className="ulist ">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Hệ điều hành:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Chip xử lý (CPU):</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>

                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Bộ nhớ &amp; Lưu trữ</p>
                            <ul className="ulist">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>RAM:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className="">Ram GB</span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Dung lượng lưu trữ:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className=""></span>
                                    </div>
                                </li>


                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Kết nối</p>
                            <ul className="ulist">

                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>SIM:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span></span>
                                    </div>
                                </li>


                            </ul>
                        </div>
                        <div className="parameter-item">
                            <p className="parameter-ttl">Pin &amp; Khối lượng</p>
                            <ul className="ulist ">
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Dung lượng pin:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span className="">mAh</span>
                                    </div>
                                </li>
                                <li className="productdetail_list1">
                                    <div className="ctLeft">
                                        <p>Khối lượng:</p>
                                    </div>
                                    <div className="ctRight">
                                        <span> g</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => { }}>
                        Đóng
                    </Button>
                </Modal.Footer>
            </Modal>
            <div className="related-products">
                <h4>Sản phẩm liên quan</h4><br />
                <div className="related-products-detail">
                    {relatedProducts.map((product) => (
                        <Product key={product.id} member={product} />
                    ))}
                </div>
            </div>
            <Footer />
        </>
    )
}
export default CTSanPham;


