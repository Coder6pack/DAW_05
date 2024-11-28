import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faStar as fullStar, faStarHalfAlt as halfStar } from '@fortawesome/free-solid-svg-icons';
import { faStar as emptyStar } from '@fortawesome/free-regular-svg-icons';

const StarRating = ({ rating }) => {
    
    return (
        <span className='star-product'>
            <span>{rating}</span>
            {[...Array(fullStars)].map((_, i) => <FontAwesomeIcon key={`full-${i}`} style={{ color: 'orange' }} icon={fullStar} />)}
            {halfStars === 1 && <FontAwesomeIcon style={{ color: 'orange' }} icon={halfStar} />}
            {[...Array(emptyStars)].map((_, i) => <FontAwesomeIcon key={`empty-${i}`} style={{ color: 'orange' }} icon={emptyStar} />)}

        </span>
    );
};

export default StarRating;
