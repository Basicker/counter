contract;

storage {
    counter: u64 = 0,
}

abi Counter {
    #[storage(read, write)]
    fn increment();

    #[storage(read)]
    fn count() -> u64;
}

impl Counter for Contract {
    #[storage(read, write)]
    fn increment() {
        let incremented = storage.counter.read() + 1;
        return storage.counter.write(incremented);
    }

    #[storage(read)]
    fn count() -> u64 {
        return storage.counter.read();
    }
}
