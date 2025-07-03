 /// <reference types="cypress" />

/* 
โจทย์ คือ หาค่าซ้ำที่อยู่ใน List A , List B แล้วมาเรียงลำดับใหม่
Given : The system provides list A and list B, which contain some duplicate numbers.
When :  Check duplicates number.
Then :  Display list new number in sorted order.
*/
function checkDuplicateItems(listA, listB) {
  const duplicates = listA.filter((item) => listB.includes(item));
  return duplicates;
}

describe('Check duplicate items and create a new list', () => {
  it('should create a new list with duplicated values from list A and B', () => {
    const listA = [1, 2, 3, 5, 6, 8, 9];
    const listB = [3, 2, 1, 5, 6, 0];

    // Call Function
    const duplicatedList = checkDuplicateItems(listA, listB);

    // Display log 
    cy.log('🔁 Duplicated items:', JSON.stringify(duplicatedList));

    // Function Check Number ( 8 and 9 not display because they are not duplicated between List A , List B)
    expect(duplicatedList).to.deep.equal([1, 2, 3, 5, 6]);
  });
});