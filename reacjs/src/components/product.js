import React, { useState, useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import numeral from 'numeral';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faStar } from '@fortawesome/free-solid-svg-icons';
import StarRating from './star_rating';
function Product(props) {
    const [selectedCapacity, setSelectedCapacity] = useState("");
    const [selectedColor, setSelectedColor] = useState("");
    const [currentPrice, setCurrentPrice] = useState("");
    const [averageRating, setAverageRating] = useState(null);
    const [availableColors, setAvailableColors] = useState([]);
    const [currentDiscount, setCurrentDiscount] = useState("");
    const [currentPercent, setCurrentPercent] = useState("");
    const [selectedCapacityId, setSelectedCapacityId] = useState(null);

    useEffect(() => {
        if (!numeral.locales['vi-custom']) {
            numeral.register('locale', 'vi-custom', {
                delimiters: {
                    thousands: '.',
                    decimal: ',',
                },
                currency: {
                    symbol: '',
                },
            });
        }
        numeral.locale('vi-custom');

        if (props.member.product_detail && props.member.product_detail.length > 0) {
            const firstDetail = props.member.product_detail[0];
            setSelectedCapacity(firstDetail.capacity?.name || '');
            setSelectedColor(firstDetail.color?.name || '');
            setCurrentPrice(DoiThanhTien(firstDetail.price));
            setSelectedCapacityId(firstDetail.capacity?.id);
            const discountPrice = firstDetail.discount_detail.length > 0 ? DoiThanhTien(firstDetail.discount_detail[0].price) : '';
            setCurrentDiscount(discountPrice);
            const preCent = firstDetail.discount_detail.length > 0 ? firstDetail.discount_detail[0].percent : '';
            setCurrentPercent(preCent);

            updateAvailableColors(firstDetail.capacity?.name || '');
            updateAverageRating(firstDetail.capacity?.id);
        }
    }, [props.member]);


   
    return (
        <>
            {currentPrice && (
                <div className="product-container">
                    <NavLink to={`/product/${props.member.name}`} className="xem">
                        <div className="detail-product">
                            <img src={`http://127.0.0.1:8000/${props.member.img_product[0]?.img_url}`} id="img-sp" /><br />
                            <span className="mo_ta">%{props.member.description}</span>
                            <h6 className="name">{props.member.name}</h6>

                            {props.member.product_detail && getUniqueDungLuongs(props.member.product_detail).map((item) => (
                                <span
                                    key={item.capacity.name}
                                    className={`capacity ${isSelectedCapacity(item.capacity.name)}`}
                                    onClick={(event) => handleCapacityChange(event, item.capacity.name)}
                                >
                                    {item.capacity?.name || ''}
                                </span>
                            ))}

                            <br /> <br />

                            {availableColors.map((color) => (
                                <span
                                    key={color}
                                    className={`color ${isSelectedColor(color)}`}
                                    onClick={(event) => handleColorChange(event, color)}
                                >
                                    {color || ''}
                                </span>
                            ))}



                            {currentDiscount ?
                                (
                                    <>
                                        <div className='price-percent'><span className="price-have-discount">{currentPrice}₫</span> -{currentPercent}%</div>
                                        <div className="price-discount">{currentDiscount}₫</div>
                                        {averageRating !== null && (
                                            <StarRating rating={averageRating} />
                                        )}

                                    </>
                                )
                                :
                                (
                                    <>
                                        <div>
                                            <strong className="price">{currentPrice}₫</strong>
                                            {averageRating !== null && (
                                                <StarRating rating={averageRating} />
                                            )}
                                        </div>
                                    </>
                                )
                            }
                        </div>
                    </NavLink>
                </div>
            )}
        </>
    );
}

export default Product;
