@isTest
public class SampleApexTestClassTest {
    
    @isTest
    static void testAddNumbers() {
        // Arrange
        SampleApexTestClass sampleClass = new SampleApexTestClass();
        Integer a = 5;
        Integer b = 7;
        
        // Act
        Integer result = sampleClass.addNumbers(a, b);
        
        // Assert
        System.assertEquals(12, result, 'Adding numbers should return the correct result.');
    }
}